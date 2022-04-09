//
//  NetworkService.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 06.03.2022.
//

import Foundation
import Alamofire
import SwiftyJSON


final class NetworkService {

    private let apiVersion = "5.131"

    private func makeComponents(for path: NetworkPaths) -> URLComponents {
        let urlComponent: URLComponents = {
            var url = URLComponents()
            url.scheme = "https"
            url.host = "api.vk.com"
            url.path = "/method/\(path.rawValue)"
            url.queryItems = [
                URLQueryItem(name: "access_token", value: UserSession.instance.token),
                URLQueryItem(name: "v", value: apiVersion),
            ]
            return url
        }()
        return urlComponent
    }

    func getUserPhotos(
        userID: Int,
        completion: @escaping ([VKPhoto]?) -> Void) {
        var urlComponets = makeComponents(for: .getAllPhotos)
        urlComponets.queryItems?.append(contentsOf: [
            URLQueryItem(name: "owner_id", value: "\(userID)"),
            URLQueryItem(name: "album_id", value: "profile"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "photo_sizes", value: "1"),
        ])
        
        if let url = urlComponets.url {
            AF
                .request(url)
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)
                        let photoJSONs = json["response"]["items"].arrayValue
                        let vkUserPhoto = photoJSONs.map { VKPhoto($0) }
                        completion(vkUserPhoto)
                    case .failure(let error):
                        print(error)
                        completion(nil)
                    }
                }
        }
    }
    
    func getUserFriends(completion: @escaping ([RealmUser]?) -> Void) {
        var urlComponents = makeComponents(for: .getFriends)
        urlComponents.queryItems?.append(contentsOf: [
            URLQueryItem(name: "fields", value: "photo_200"),
        ])
        
        if let url = urlComponents.url {
            AF
                .request(url)
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)
                        let usersJSONs = json["response"]["items"].arrayValue
                        let vkUsers = usersJSONs.map { RealmUser($0) }
                        DispatchQueue.main.async {
                            completion(vkUsers)
                        }
                    case .failure(let error):
                        print(error)
                        completion(nil)
                    }
                }
        }
    }

    func getUserGroups(completion: @escaping ([RealmUser]?) -> Void) {
        var urlComponents = makeComponents(for: .getGroups)
        urlComponents.queryItems?.append(contentsOf: [
            URLQueryItem(name: "userAvatarURL", value: "photo_200"),
        ])
        
        if let url = urlComponents.url {
            AF
                .request(url)
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)
                        let usersJSONs = json["response"]["items"].arrayValue
                        let vkUsers = usersJSONs.map { VKGroup($0) }
                    case .failure(let error):
                        print(error)
                        completion(nil)
                    }
                }
        }
    }

    
    func getUserNews(completion: @escaping ([RealmNews]?) -> Void) {
        var urlComponents = makeComponents(for: .getNews)
        urlComponents.queryItems?.append(contentsOf: [
            URLQueryItem(name: "fields", value: "photo_200"),
        ])
        
        if let url = urlComponents.url {
            AF
                .request(url)
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)
                        let newsJSONs = json["response"]["items"].arrayValue
                        let vkNews = newsJSONs.map { RealmNews($0) }
                        DispatchQueue.main.async {
                            completion(vkNews)
                        }
                    case .failure(let error):
                        print(error)
                        completion(nil)
                    }
                }
        }
    }
    
    
    
    
    
    
//    func getGlobalGroupSearch(searchText:String) {
//        var urlComponents = makeComponents(for: .getGlobalGroupsSearch)
//        urlComponents.queryItems?.append(contentsOf: [
//            URLQueryItem(name: "q", value: searchText),
//        ])
//
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        if let url = urlComponents.url {
//            session.dataTask(with: url) { (data, response, error) in
//                if let data = data {
//                    print(try? JSONSerialization.jsonObject(
//                        with: data,
//                        options: .allowFragments))
//                }
//            }
//            .resume()
//        }
//    }

    

}
        
        






