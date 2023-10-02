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
    var isValidEmail = false {
        //isValidEmail의 값이 변경될때마다 아래 메소드가 호출됨(유효성 검사 로직 수행)
        //세팅이 되고 난 후에, 아래 코드 블럭을 수행하겠다. didSet
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo() //유효성 검사 로직 수행
        }
    }
    var isValidName = false{
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo() //유효성 검사 로직 수행
        }
    }
    var isValidNickName = false{
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo() //유효성 검사 로직 수행
        }
    }
    var isValidPassword = false{
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo() //유효성 검사 로직 수행
        }
    }
    
    //TextFields
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    var textFields:[UITextField] {
        [emailTextField,nameTextField,nickNameTextField,passwordTextField]
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signupButton.isEnabled = false //버튼이 눌리지 않도록
        setupTextField() //텍스트 필드의 값이 변경되는 이벤트 감지시 textFieldEditingChanged를 타겟으로 연결
        //signupButton.layer.cornerRadius = 5 확장시킨 코너 코드로 값 변경도 가능
        
        //bug fix : 스와이프를 통해 뒤로가기 구현
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }
    

    
    

    //MARK: Actions
    @objc
    func textFieldEditingChanged(_ sender : UITextField){
        let text = sender.text ?? ""
        
        //isValidEmail,등의 값이 변경될때마다 didSet이 호출되어 유효성 검사 수행
        switch sender{
        case emailTextField:
            self.isValidEmail = text.isValidEmail() //정규표현식을 통해 옳바른 값인지 확인
            print("email")
        case nameTextField:
            print("name")
            self.isValidName = text.count > 2
        case nickNameTextField:
            print("nickname")
            self.isValidNickName = text.count > 2
        case passwordTextField:
            self.isValidPassword = text.isValidPassword() //정규표현식을 통해 옳바른 값인지 확인
            print("password")
        default:
            fatalError("Missing TextFields..")
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        //뒤로가기 키 커스텀 => 버튼이 눌려질 경우, 네비게이션 컨트롤러에서 pop한다. => 뒤로가기처리
        self.navigationController?.popViewController(animated: true)
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
        
        //단순화 코드 => for-each문 사용하여 모두 타겟 설정 아래 코드는, 위 코드와 동일함
        textFields.forEach{ tf in //textField에 속한 모든 값들(tf)에 대해서
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    

    //사용자가 입력한 회원정보를 확인하고 -> UI 업데이트
    private func validateUserInfo() {
        
        
        // 입력받은 텍스트필드가 모두 조건을 만족한다면
        if isValidEmail
            && isValidName
            && isValidNickName
            && isValidPassword {
            
            //유효성검사 -> true
            self.signupButton.isEnabled = true //버튼이 눌릴 수 있도록
            UIView.animate(withDuration: 0.33) { //애니메이션 효과, 딜레이 0.33
                self.signupButton.backgroundColor = UIColor(named: "facebookColor")
            }
            
        }else{
            //유효성검사 -> false
            //버튼이 눌리지 않도록 설정
            self.signupButton.isEnabled = false //버튼이 눌리지 않도록
            UIView.animate(withDuration: 0.33) { //애니메이션 효과, 딜레이 0.33
                self.signupButton.backgroundColor = UIColor(named: "disableButtonColor")
            }
        }
    }
    
}

// 정규표현식
extension String {
    //대문자, 소문자, 특수문자, 숫자를 포함하며 8자리 이상인지 확인하여 True리턴
    func isValidPassword () -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    //@ 를 포함하고 있는지, 2글자 이상인지 확인
    func isValidEmail () -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate( format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
