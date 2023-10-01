//
//  LoginViewController.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/01.
//

import UIKit

class LoginViewController: UIViewController {

    
    var email = String()
    var password = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func emailEditingFieldChanged(_ sender: UITextField) {
        let email = sender.text ?? "" //값이 없을 경우 ""
        //print(email)
        self.email = email
    }
    
    
    
    @IBAction func passWordEditingFieldChanged(_ sender: UITextField) {
        
        let password = sender.text ?? "" //값이 없을 경우 ""
        //print(password)
        self.password = password
        
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
    }
    
    
    @IBAction func joinButtonDidTap(_ sender: UIButton) {
    }
    
}
