//
//  RegisterViewController.swift
//  fromFirst
//
//  Created by fathy  on 7/27/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var register: UIButton!
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    let registerUrl = "http://rate-ak.com/api/clientRegister"
    override func viewDidLoad() {
        super.viewDidLoad()

        register.layer.cornerRadius = 10
    }
    fileprivate func createAlertError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        guard let name = nameTF.text, !name.isEmpty else {
            createAlertError(message: "please enter name")
            return
        }
        guard let email = emailTF.text, !email.isEmpty else {
            createAlertError(message: "please enter email")
            return
        }
        guard let password = passwordTF.text, !password.isEmpty else {
            createAlertError(message: "please enter password")
            return
        }
        guard let phone = phoneTF.text, !phone.isEmpty else {
            createAlertError(message: "please enter phone")
            return
        }
        RegisterAPIService.instance.register(url: registerUrl, email: email, passord: password, name: name, phone: phone) { (registerData, error) in
            if let myerror = error {
                print(myerror)
            } else {
                guard let mydata = registerData else { return }
                print(mydata.success)
                if mydata.success == true {
                    // navigate to home page
                    
                } else {
                    self.createAlertError(message: mydata.message!)
                }
            }
        }
    }
    
}
