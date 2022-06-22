//
//  News2ViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 16.05.2022.
//

import UIKit
import RealmSwift
import PromiseKit

enum NewsScreen: Int {
    case authorNews = 0
    case textNews = 1
    case imageNews = 2
    case infoNews = 3
}


final class News2ViewController: UIViewController {
    
    
    @IBOutlet weak var newsTableView: UITableView! {
        didSet {
            self.newsTableView.dataSource = self
            self.newsTableView.delegate = self
        }
    }
    
    private let networkService = NetworkService()
    private var newsArray = [RealmNews]()
    private var newsAuthorFriendsArray = [RealmUser]()
    private var newsAuthorGroupsArray = [RealmGroup]()
    private var token: NotificationToken?
    private let news = try? RealmService.load(typeOf: RealmNews.self)
    
    let vkNews = [VKPhotoSize]()
    
    private var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        getNews()
        observeRealm()

//        newsTableView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
//
//        DispatchQueue.global(qos: .userInteractive).async {
//            networkService.getUserNews { [weak self] user, group, news in
//                guard
//                    let self = self else { return }
//                let realmUser = user.map { RealmUser(itemsUser: $0) }
//                let realmGroup = group.map { RealmGroup(itemsGroup: $0) }
//                let realmNews = news.map { RealmNews(itemsNews: $0) }
//
//                DispatchQueue.main.async {
//                    self.newsAuthorFriendsArray = realmUser
//                    self.newsAuthorGroupsArray = realmGroup
//                    self.newsArray = realmNews
//                    self.newsTableView.reloadData()
//                    print(self.newsArray.count, self.newsAuthorGroupsArray.count,
//                          self.newsAuthorFriendsArray.count)
//                }
//            }
//        }
//
//        newsTableView.register(UINib(nibName: "AuthorNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "AuthorCell")
//        newsTableView.register(UINib(nibName: "TextNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "TextCell")
//        newsTableView.register(UINib(nibName: "ImageNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
//        newsTableView.register(UINib(nibName: "InfoPanelTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        
    }
    
    
    @objc
    private func refresh() {
        getNews()
    }
    
    private func getNews() {
        //startFrom: Date().timeIntervalSince1970 + 1
        networkService.getUserNews { [weak self] RealmNews in
            self?.newsTableView.refreshControl?.endRefreshing()
            guard let realmNews = RealmNews else { return }
            do {
                try RealmService.save(items: realmNews)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func observeRealm() {
        token = news?.observe( { changes in
            switch changes {
            case .initial(let results):
                if results.count > 0 {
                    self.newsTableView.reloadData()
                }

                print(results)
            case let .update(results, deletions, insertions, modifications):
                break

            print(results, deletions, insertions, modifications)
                self.newsTableView.reloadData()
            case .error(let error):
                print(error)
            }
        })
    }
}


extension News2ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        newsArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch NewsScreen(rawValue: indexPath.row) {
        case .authorNews:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorCell", for: indexPath) as? AuthorNewsTableViewCell
            else { return UITableViewCell() }
            if newsArray[indexPath.section].author > 0 {
                cell .configure(authorUser: newsAuthorFriendsArray[indexPath.section], news: newsArray[indexPath.section])
            } else if newsArray[indexPath.section].author < 0 {
                cell .configure(authorGroup: newsAuthorGroupsArray[indexPath.section], news: newsArray[indexPath.section])
            } else {
            }
            return cell
            
        case .textNews:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as? TextNewsTableViewCell
            else { return UITableViewCell() }
            
            cell.configure(textNews: newsArray[indexPath.section])
            
            return cell
            
        case.imageNews:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageNewsTableViewCell
            else { return UITableViewCell() }
            
            return cell
            
        case .infoNews:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InfoPanelTableViewCell
            else { return UITableViewCell() }
            
            //cell.configure(news: newsArray[indexPath.section])
            
            return cell
            
        default:
            fatalError()
            
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        case 2:
            return 0
        case 3:
            return 50
        default:
            return UITableView.automaticDimension
        }
    }
}

