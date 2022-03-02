//
//  GetGroupsList.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 02.03.2022.
//

import Foundation


struct GroupsResponse: Decodable {
    var response: Response
    
    struct Response: Decodable {
        var count: Int
        var items: [Items]
        
        struct Items: Decodable {
            var id: Int
            var name: String
            var screen_name: String
            var photo_50: String
        }
    }
}

class GetGroupsList {
    
    //данные для авторизации в ВК
    func loadData(complition: @escaping ([Group]) -> Void ) {
        
        // Конфигурация по умолчанию
        let configuration = URLSessionConfiguration.default
        // собственная сессия
        let session =  URLSession(configuration: configuration)
        
        // конструктор для URL
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/groups.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: String(Session.instance.userId)),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.122")
        ]
        
        // задача для запуска
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
                        print("Запрос к API: \(urlConstructor.url!)")
        }
    }
}
