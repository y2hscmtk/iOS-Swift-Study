//
//  LoginViewController.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/01.
//

import UIKit

class LoginViewController: UIViewController {

    
    var email = String(){
        didSet{ //프로퍼티 옵저버
            self.checkedRegisterInfo() //사용자가 입력한 값과 비교했을때 올바른지 확인
        }
    }
    var password = String(){
        didSet{
            self.checkedRegisterInfo() //사용자가 입력한 값과 비교하여 올바른지 확인
        }
    }
    
    var registeredEmail : String = "y2_12@naver.com"
    var registeredPassWord : String = "test1234!"
    
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkedRegisterInfo() //가입한 정보와 일치하는지 확인
        // Do any additional setup after loading the view.
        loginButton.isEnabled = false //초기에는 눌릴수없음
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
    
    
    //로그인버튼 클릭시
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        //회원가입정보를 전달받아서, 그것과 textField의 값이 일치하면,
        //로그인이 되어야 한다.
        if self.email == registeredEmail &&
            self.password == registeredPassWord{
            //성공시 메인뷰로 화면전환
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainView = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController //MainViewController타입으로 다운캐스팅
            mainView.modalPresentationStyle = .fullScreen
            
            //self.navigationController?.pushViewController(mainView, animated: true)
            //self.present(mainView, animated: true)
            
            //화면 전환을 씬 변경을 통해 처리함으로서, 로그인 화면을 메모리에서 지움
            self.view.window?.windowScene?.keyWindow?.rootViewController = mainView
        }else{
            print("login failed")
        }
        
        
    }
    
    
    @IBAction func joinButtonDidTap(_ sender: UIButton) {
        //화면 이동
        
        // 1. 스토리보드 생성(스토리보드에 대한 참조 가져오기 => 여러개의 스토리보드를 사용할 수 있으므로)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 뷰 컨트롤러 생성(전환할 화면의 뷰 컨트롤러 생성)
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController //RegisterViewController타입으로 다운캐스팅 => 스토리보드의 instantiateViewController 메소르드를 통해 발견한 view는 ViewController타입이므로, ViewController를 상속받은 RegisterviewController로 다운캐스팅을 해줘야 화면 전환이 가능
        
        // 3. 화면전환 메소드를 사용하여 화면 전환 => 아래에서 위로 올라오는 형태(모달)
        //self.present(registerViewController, animated: true,completion: nil)
        //오른쪽에서 화면이 등장하길 바란다면 navigationController를 사용하여 위 기능을 구현해야함
        
        // 3-2. navigationController를 사용하여 구현하기
        //navigationController : 단어의 의미 그대로 내용물 없이 임베디드된 화면에 대한 navigation을 관리해줌 어떤화면을 보여주고 어떤화면으로 이동할지 결정하는 역할을 하는 컨테이너 뷰 => 수적적으로 더 상세한 내용으로 들어갈때 주로 사용됨
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        //userInfo 값 전달 받기
        registerViewController.passUserInfo = { (userInfo) in
            print(userInfo)
            //값 등록하기
            self.registeredEmail = userInfo.email
            self.registeredPassWord = userInfo.password
        }
    }
    
    
    //MARK: helper
    private func checkedRegisterInfo(){
        if self.email == registeredEmail &&
            self.password == registeredPassWord{
            UIView.animate(withDuration: 0.33) { //애니메이션 효과, 딜레이 0.33
                self.loginButton.backgroundColor = UIColor(named: "facebookColor")
            }
            self.loginButton.isEnabled = true
        }else{
            UIView.animate(withDuration: 0.33) { //애니메이션 효과, 딜레이 0.33
                self.loginButton.backgroundColor = UIColor(named: "disableButtonColor")
            }
            self.loginButton.isEnabled = false
        }
    }
    
    
//    private func setUpAttribute(){
//        //registerButton
//
//        let text1 = "계정이 없으신가요?"
//        let text2 = "가입하기"
//
//        let font1 = UIFont.systemFont(ofSize: 13)
//        let font2 = UIFont.boldSystemFont(ofSize: 13)
//
//        let color1 = UIColor.darkGray
//        let color2 = UIColor(named: "facebookColor")
//
//
//    }
    
}
