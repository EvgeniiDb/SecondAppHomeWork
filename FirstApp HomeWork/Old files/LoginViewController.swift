//
//  ViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 06.01.2022.
//

import UIKit
import CoreData
import KeychainSwift

class LoginViewController: UIViewController {
    
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var nameProjectLabel: UILabel!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loadingView1: UIView!
    @IBOutlet weak var loadingView2: UIView!
    @IBOutlet weak var loadingView3: UIView!
    
    let segueIdentifierToTabBar = "reuseIdentifierToTabBar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setupTextFields()
        setupImageLoading()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardDie))
        backView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func keyboardDie() {
        self.backView.endEditing(true)
    }
    
    func showAlert(message: String, completion: @escaping (UIAlertAction) -> Void) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: completion)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        if let login = loginTextField.text,
           let password = passwordTextField.text,
           !login.isEmpty,
           !password.isEmpty,
           login == "1",
           password == "1" {
            backView.backgroundColor = #colorLiteral(red: 0, green: 0.03275734931, blue: 0.9962219596, alpha: 1)
            animatedLoadingLabel()
        } else {
            showAlert(message: "Логин или пароль введены неверно, повторите попытку!")
            { _ in self.backView.backgroundColor = UIColor.red
                return
            }
        }
    }
}

// MARK: - Loading indicator animation

extension LoginViewController {
    
    func setupImageLoading() {
        loadingView1.alpha = 0
        loadingView1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        loadingView2.alpha = 0
        loadingView2.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        loadingView3.alpha = 0
        loadingView3.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    
    func animatedLoadingLabel() {
        
        UIView.animate(withDuration: 0.8, delay: 0.2, options: [.autoreverse, .repeat], animations: {
            self.loadingView1.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.4, options: [.autoreverse, .repeat], animations: {
            self.loadingView2.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.6, options: [.autoreverse, .repeat], animations: {
            self.loadingView3.alpha = 1
        }, completion: {_ in
            self.performSegue(withIdentifier: self.segueIdentifierToTabBar, sender: nil)
        })
    }
    
//    func animatedLoadingLabel2() {
//        UIView.animate(withDuration: 3.5, delay: 3.5, options: [.repeat], animations: { self.animatedLoadingLabel.alpha = 0
//        }, completion: {_ in
//            self.performSegue(withIdentifier: self.segueIdentifierToTabBar, sender: nil)
//        })
//    }
    
}









