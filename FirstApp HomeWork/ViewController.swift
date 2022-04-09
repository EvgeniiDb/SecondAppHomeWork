//
//  ViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 06.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }

    @IBAction func didTapOnButton(_ sender: UIButton) {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "loginSegue" else { return false }
    
        
        if checkForValidationData() {
            return true
        } else {
            showAlert()
            return false
        }
    
    }
    
    
    @IBAction func tapRegButton(_ sender: UIButton) {
        print("Введите номер телефона или email")
    }

    @IBAction func tapForgPassButton(_ sender: UIButton) {
        print("Напомнить пароль")
    }
    
}

private extension ViewController {
    func setupTextFields() {
        loginTextField.keyboardType = .emailAddress
        passwordTextField.keyboardType = .numberPad
    }
    
    internal override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //необходимо уточнить правильность написания данного кода
    }
 
    func checkForValidationData() -> Bool {
        
        guard let loginText = loginTextField.text,
              let passwordText = passwordTextField.text else {
                  return false
              }
        
        let isValidData = loginText == "hello" && passwordText == "12345"
        return isValidData
    }
 
    func showAlert() {
        let alertViewController = UIAlertController(title: "Ошибка", message: "Вы ввели не верные данные", preferredStyle: .alert)
        let firstButton = UIAlertAction(title: "One", style: .default, handler: nil)
        let secondButton = UIAlertAction(title: "Two", style: .destructive, handler: nil)
        let doneButton = UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            self.passwordTextField.text = ""
            self.loginTextField.text = "" //очищает текстфилд при не верном вводе
        })
        alertViewController.addAction(doneButton) //OK
        alertViewController.addAction(firstButton) //One
        alertViewController.addAction(secondButton) //Two
        
        present(alertViewController, animated: true, completion: nil)
    }
    
}












