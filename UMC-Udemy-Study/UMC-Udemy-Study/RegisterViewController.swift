//
//  RegisterViewController.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/01.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: Properties
    //Checked is valid value in textField's value
    var isValidEmail = false
    var isValidName = false
    var ValidNickName = false
    var isValidPassword = false
    
    //TextFields
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var textFields:[UITextField] {
        [emailTextField,nameTextField,nickNameTextField,passwordTextField]
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField() //텍스트 필드의 값이
    }
    

    
    

    //MARK: Actions
    @objc
    func textFieldEditingChanged(_ sender : UITextField){
        let text = sender.text ?? ""
        
        switch sender{
        case emailTextField:
            print("email")
        case nameTextField:
            print("name")
        case nickNameTextField:
            print("nickname")
        case passwordTextField:
            print("password")
        default:
            fatalError("Missing TextFields..")
        }
    }
    
    
    //MARK: Helpers
    
    private func setupTextField(){
        //이메일 텍스트 필드에서 이벤트가 발생하게되면 이벤트를 처리할 타겟 설정
        //=> RegisterController(self)
        //action : 어떤 함수를 호출할 것인지
        //for : 어떤 이벤트에 대해 타겟을 설정할것인지 => editingChanged(EditText의 값이 변경되는 이벤트에 대해서)
        // 전체 해석 : emailTextField의 for이벤트가 발생할 경우 action을 수행하는데, 수행할 주체는 self다.
//        emailTextField.addTarget(self, action: #selector(textFieldEditingChanged(_sender: )), for: .editingChanged)
//
//        nameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_sender: )), for: .editingChanged)
//
//        nickNameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_sender: )), for: .editingChanged)
//
//        passwordTextField.addTarget(self, action: #selector(textFieldEditingChanged(_sender: )), for: .editingChanged)
        
        //단순화 코드 => for-each문 사용하여 모두 타겟 설정
        textFields.forEach{ tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
}
