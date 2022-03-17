//
//  DataSettings.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 13.02.2022.
//

import UIKit

class DataSettings {
//
//    func setupUser() -> [User] {
//
//        var resultArray = [User]()
//
//        let userOnePhotoArray = [UIImage(named: "AS")!, UIImage(named: "AS")!, UIImage(named: "AS")!, UIImage(named: "AS")!]
//        let userOne = User(name: "Iron Arny", avatar: UIImage(named: "AS")!, photoArray: userOnePhotoArray, surname: "Shwarz")
//
//        resultArray.append(userOne)
//
//        let userTwoPhotoArray = [UIImage(named: "DJ")!, UIImage(named: "DJ")!, UIImage(named: "DJ")!, UIImage(named: "DJ")!]
//        let userTwo = User(name: "Don Jonson", avatar: UIImage(named: "DJ")!, photoArray: userTwoPhotoArray, surname: "Marlboro")
//
//        resultArray.append(userTwo)
//
//        let userThreePhotoArray = [UIImage(named: "MR")!, UIImage(named: "MR")!, UIImage(named: "MR")!, UIImage(named: "MR")!]
//        let userThree = User(name: "Evgenii Di", avatar: UIImage(named: "MR")!, photoArray: userThreePhotoArray, surname: "Mikky")
//
//        resultArray.append(userThree)
//
//        let userFourPhotoArray = [UIImage(named: "BY")!, UIImage(named: "BY")!, UIImage(named: "BY")!, UIImage(named: "BY")!]
//        let userFour = User(name: "Bruce Toughie", avatar: UIImage(named: "BY")!, photoArray: userFourPhotoArray, surname: "Nut")
//
//        resultArray.append(userFour)
//
//        let sortiredNames = resultArray.sorted(by: {$0.name < $1.name})
//
//        resultArray = sortiredNames
//
//        return resultArray
//    }
    
//    func setupGroup() -> [Group] {
//        
//        var resultArray = [Group]()
//        
//        let globalGroupOne = Group(name: "FunGroup VK", avatar: UIImage(named: "1")!, description: nil)
//        resultArray.append(globalGroupOne)
//        
//        let globalGroupTwo = Group(name: "FunGroup Holiwood", avatar: UIImage(named: "GP")!, description: nil)
//        resultArray.append(globalGroupTwo)
//        
//        let globalGroupThree = Group(name: "FunGroup Family", avatar: UIImage(named: "MyF")!, description: nil)
//        resultArray.append(globalGroupThree)
//        
//        let globalGroupFour = Group(name: "FunGroup The Doctor", avatar: UIImage(named: "VR46")!, description: nil)
//        resultArray.append(globalGroupFour)
//        
//        return resultArray
//    }
    
    func setupNews() -> [News] {
        
        var resultArray = [News]()
        
        let newsOne = News(newsText: "По итогам первого дня официальных тестов MotoGP на трассе Сепанг итоговый протокол возглавили два пилота Aprilia. Частично это не есть неожиданность, поскольку благодаря концессиям у обоих пилотов была возможность выехать на малазийский трек раньше остальных. Однако результат лидера Алейша Эспаргаро всё равно впечатляет, ведь он проехал лучший круг за 1’58.371 и уступил всего одну десятую рекорду трассы. И это не его максимум.", newsImage: UIImage(named: "n_1"), numberOfViews: 100)
        
        resultArray.append(newsOne)
        
        let newsTwo = News(newsText: "Команда Gresini Racing официально сообщила о печальном известии. К сожалению, чемпион мира 125сс (1985, 1987) и руководитель команды MotoGP Фаусто Грезини (основана в 1997-м) скончался после почти двухмесячной госпитализации из-за осложнений, вызванных коронавирусом.", newsImage: UIImage(named: "n_2"), numberOfViews: 100)
        
        resultArray.append(newsTwo)
        
        let newsThree = News(newsText: "12 января Маверику Виньялесу, одной из самых ярких персон современного MotoGP, исполнилось 27 лет. Несмотря на столь юный возраст, ТопГан успел повыступать в цветах трёх разных производителей, и в сезоне-2022 он продолжит выступать за Aprilia. Маверика всегда считали одним из самых одарённых, однако нестабильные результаты ещё не позволили Маку побороться за престижную корону.", newsImage: UIImage(named: "n_3"), numberOfViews: 200)
        
        resultArray.append(newsThree)
        
        let newsFour = News(newsText: "Тесты в Сепанге — возможность для ощущения сладостного предвкушения предстоящего сезона MotoGP. Хотя для гонщиков и производителей тесты в основном является возможностью для тонкой настройки мотоцикла, на котором они проведут сезон-2022. Пилот Suzuki Алекс Ринс доволен тем, как провёл первый день малазийских тестов, заняв третье место, хотя, как обычно, ещё есть куда расти.", newsImage: UIImage(named: "n_4"), numberOfViews: 250)
        
        resultArray.append(newsFour)
        
        return resultArray
    }

}


