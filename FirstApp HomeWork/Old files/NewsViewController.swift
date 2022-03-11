//
//  NewsViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 06.02.2022.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
        }
    }
    
    private let reuseIdentifier = "NewsCell"
    
    private var newsArray = [News]()
    
    private let dataSetingsNews = DataSettings()
    
    private func setupNews() -> [News] {
        
        var resultArray = [News]()
        
        let newsOne = News(newsText: "По итогам первого дня официальных тестов MotoGP на трассе Сепанг итоговый протокол возглавили два пилота Aprilia. Частично это не есть неожиданность, поскольку благодаря концессиям у обоих пилотов была возможность выехать на малазийский трек раньше остальных. Однако результат лидера Алейша Эспаргаро всё равно впечатляет, ведь он проехал лучший круг за 1’58.371 и уступил всего одну десятую рекорду трассы. И это не его максимум.", newsImage: UIImage(named: "n_1"), numberOfViews: 1)
        
        resultArray.append(newsOne)
        
        let newsTwo = News(newsText: "Команда Gresini Racing официально сообщила о печальном известии. К сожалению, чемпион мира 125сс (1985, 1987) и руководитель команды MotoGP Фаусто Грезини (основана в 1997-м) скончался после почти двухмесячной госпитализации из-за осложнений, вызванных коронавирусом.", newsImage: UIImage(named: "n_2"), numberOfViews: 2)
        
        resultArray.append(newsTwo)
        
        let newsThree = News(newsText: "12 января Маверику Виньялесу, одной из самых ярких персон современного MotoGP, исполнилось 27 лет. Несмотря на столь юный возраст, ТопГан успел повыступать в цветах трёх разных производителей, и в сезоне-2022 он продолжит выступать за Aprilia. Маверика всегда считали одним из самых одарённых, однако нестабильные результаты ещё не позволили Маку побороться за престижную корону.", newsImage: UIImage(named: "n_3"), numberOfViews: 3)
        
        resultArray.append(newsThree)
        
        let newsFour = News(newsText: "Тесты в Сепанге — возможность для ощущения сладостного предвкушения предстоящего сезона MotoGP. Хотя для гонщиков и производителей тесты в основном является возможностью для тонкой настройки мотоцикла, на котором они проведут сезон-2022. Пилот Suzuki Алекс Ринс доволен тем, как провёл первый день малазийских тестов, заняв третье место, хотя, как обычно, ещё есть куда расти.", newsImage: UIImage(named: "n_4"), numberOfViews: 4)
        
        resultArray.append(newsFour)
        
        return resultArray
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //newsArray = dataSetingsNews.setupNews()
        
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: reuseIdentifier)
       
    }
}

extension NewsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell()}
        cell.configure(news: newsArray[indexPath.item])
        
        return cell
    }
}

extension NewsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 10, height: 10)
    }
    
}
