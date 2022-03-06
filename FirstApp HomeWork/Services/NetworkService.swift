//
//  NetworkService.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 06.03.2022.
//

import Foundation
//import Alamofire
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
