//
//  NetworkService.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 06.03.2022.
//

import Foundation
import Alamofire
//import SwiftyJSON


final class NetworkService {

    private let apiVersion = "5.130"

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

    func getUserFriends() {
        var urlComponents = makeComponents(for: .getFriends)
        urlComponents.queryItems?.append(contentsOf: [
            URLQueryItem(name: "fields", value: "photo_200"),
        ])

        let session = URLSession(configuration: URLSessionConfiguration.default)
        if let url = urlComponents.url {
            session.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    print(try? JSONSerialization.jsonObject(
                        with: data,
                        options: .allowFragments))
//                    let vkResponse = try? JSONDecoder().decode(VKResponse.self, from: data)
//                    print(vkResponse) //через Decoder (Respons)
                }
            }
            .resume()
        }
    }

    func getUserGroup() {
        var urlComponents = makeComponents(for: .getGroups)
        urlComponents.queryItems?.append(contentsOf: [
            URLQueryItem(name: "fields", value: "photo_200"),
        ])

        let session = URLSession(configuration: URLSessionConfiguration.default)
        if let url = urlComponents.url {
            session.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    print(try? JSONSerialization.jsonObject(
                        with: data,
                        options: .allowFragments))
                }
            }
            .resume()
        }
    }

   
    func getGlobalGroup() {
        var urlComponents = makeComponents(for: .getGlobalGroups)
        urlComponents.queryItems?.append(contentsOf: [
            URLQueryItem(name: "type", value: "group"),
        ])

        let session = URLSession(configuration: URLSessionConfiguration.default)
        if let url = urlComponents.url {
            session.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    print(try? JSONSerialization.jsonObject(
                        with: data,
                        options: .allowFragments))
                }
            }
            .resume()
        }
    }

  
    func getUserPhoto() {
        var urlComponents = makeComponents(for: .getPhotos)
        urlComponents.queryItems?.append(contentsOf: [
            URLQueryItem(name: "fields", value: "photo_200"),
        ])

        let session = URLSession(configuration: URLSessionConfiguration.default)
        if let url = urlComponents.url {
            session.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    print(try? JSONSerialization.jsonObject(
                        with: data,
                        options: .allowFragments))
                }
            }
            .resume()
        }
    }



}



//            AF.request(url)
//                .responseData { response in
//                    switch response.result {
//                    case .success(let data):
//                        let json = JSON(data)
//                        let usersJSONs = json["response"]["items"].arrayValue
//                        let vkUsers = usersJSONs.map { VKUser($0) }
//
//                    case .failure(let afError):
//                        break
//                    }
//                }
//        }
//    }
//}

















//class NetworkService {
//
//    private var urlConstructor: URLComponents = {
//        var constructor = URLComponents()
//        constructor.scheme = "https"
//        constructor.host = "api.vk.com"
//        constructor.path = "/method"
//
//        return constructor
//    }()
//
//
//    func fetchUserFriends(completion: @escaping (Result<[ItemsFriend], Error>) -> Void ) {
//        var constructor = urlConstructor
//        constructor.path = "/method/friends.get"
//        constructor.queryItems = [
//            URLQueryItem(name: "user_id", value: Session.instance.userIdString),
//            URLQueryItem(name: "order", value: "hints"),
//            URLQueryItem(name: "count", value: "20"),
//            URLQueryItem(name: "fields", value: "photo_50"),
//            URLQueryItem(name: "access_token", value: Session.instance.token),
//            URLQueryItem(name: "v", value: "5.131"),
//        ]
//
//        guard let url = constructor.url else { return }
//
//        let session = URLSession(configuration: .default)
//
//        let task = session.dataTask(with: url) { data, response, error in
//            guard error == nil,
//                  let data = data else { return }
//
//            do {
//                let friendsData = try JSONDecoder().decode(VKResponse<ResponseFriends>.self, from: data)
//
//                completion(.success(friendsData.response.items))
//
//            } catch let error as NSError {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
//
//
//    func fetchUserGroups(completion: @escaping (Result<[ItemsGroup], Error>) -> Void ) {
//        var constructor = urlConstructor
//        constructor.path = "/method/groups.get"
//        constructor.queryItems = [
//            URLQueryItem(name: "user_id", value: Session.instance.userIdString),
//            URLQueryItem(name: "count", value: "20"),
//            URLQueryItem(name: "extended", value: "1"),
//            URLQueryItem(name: "access_token", value: Session.instance.token),
//            URLQueryItem(name: "v", value: "5.131"),
//        ]
//
//        guard let url = constructor.url else { return }
//
//        let session = URLSession(configuration: .default)
//
//        let task = session.dataTask(with: url) { data, response, error in
//            guard error == nil,
//                  let data = data else { return }
//
//            do {
//                let friendsData = try JSONDecoder().decode(VKResponse<ResponseGroups>.self, from: data)
//
//                completion(.success(friendsData.response.items))
//
//            } catch let error as NSError {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
//
//
//    func fetchGlobalGroup(groupSearch: String, completion: @escaping (Result<[ItemsGroup], Error>) -> Void ) {
//        var constructor = urlConstructor
//        constructor.path = "/method/groups.search"
//        constructor.queryItems = [
//            URLQueryItem(name: "user_id", value: Session.instance.userIdString),
//            URLQueryItem(name: "q", value: groupSearch),
//            URLQueryItem(name: "type", value: "group"),
//            URLQueryItem(name: "count", value: "10"),
//            URLQueryItem(name: "access_token", value: Session.instance.token),
//            URLQueryItem(name: "v", value: "5.131"),
//        ]
//
//        guard let url = constructor.url else { return }
//
//        let session = URLSession(configuration: .default)
//
//        let task = session.dataTask(with: url) { data, response, error in
//            guard error == nil,
//                  let data = data else { return }
//
//            do {
//                let friendsData = try JSONDecoder().decode(VKResponse<ResponseGroups>.self, from: data)
//
//                completion(.success(friendsData.response.items))
//
//            } catch let error as NSError {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
//
//
//    func fetchPhotos(friendId: String, completion: @escaping (Result<[ItemsPhotoArray], Error>) -> Void ) {
//        var constructor = urlConstructor
//        constructor.path = "/method/photos.get"
//        constructor.queryItems = [
//            URLQueryItem(name: "user_id", value: Session.instance.userIdString),
//            URLQueryItem(name: "owner_id", value: friendId),
//            URLQueryItem(name: "album_id", value: "profile"),
//            URLQueryItem(name: "extended", value: "1"),
//            URLQueryItem(name: "count", value: "6"),
//            URLQueryItem(name: "access_token", value: Session.instance.token),
//            URLQueryItem(name: "v", value: "5.131"),
//        ]
//
//        guard let url = constructor.url else { return }
//
//        let session = URLSession(configuration: .default)
//
//        let task = session.dataTask(with: url) { data, response, error in
//            guard error == nil,
//                  let data = data else { return }
//
//            do {
//                let friendsData = try JSONDecoder().decode(VKResponse<ResponsePhotoArray>.self, from: data)
//
//                completion(.success(friendsData.response.items))
//
//            } catch let error as NSError {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
