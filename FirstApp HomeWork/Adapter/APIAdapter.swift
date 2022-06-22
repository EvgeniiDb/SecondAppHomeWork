//
//  APIAdapter.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 22.06.2022.
//

import UIKit

protocol APIAdapter {
    func getUserNews(startTime: Int,
                     startFrom: [PostType: String?],
                     completion: @escaping ([PostType: VKNews?]) -> Void)
    func getUserPhotos(UserID: Int,
                       completion: @escaping ([VKPhoto]?) -> Void)
    
    func getUserFriends(completion: @escaping ([RealmUser]?) -> Void)
    func getUserGroups(completion: @escaping ([RealmGroup]?) -> Void)
    func getGlobalGroupSearch(searchString: String,
                      completion: @escaping ([Group]?) -> Void)
    func joinGroup(groupID: Int,
                   completion: @escaping (Bool) -> Void)
    func getImage(url: String, completion: @escaping (UIImage?) -> Void)
    func loadImage(placeholderImage: UIImage?,
                   toImageView: UIImageView?,
                   url: String,
                   onFailureImage: UIImage?)
    
    
}





