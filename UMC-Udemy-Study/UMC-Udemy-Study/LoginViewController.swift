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
        //화면 이동
        
        // 1. 스토리보드 생성(스토리보드에 대한 참조 가져오기 => 여러개의 스토리보드를 사용할 수 있으므로)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 뷰 컨트롤러 생성(전환할 화면의 뷰 컨트롤러 생성)
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController //RegisterViewController타입으로 다운캐스팅 => 스토리보드의 instantiateViewController 메소르드를 통해 발견한 view는 ViewController타입이므로, ViewController를 상속받은 RegisterviewController로 다운캐스팅을 해줘야 화면 전환이 가능
        
        // 3. 화면전환 메소드를 사용하여 화면 전환 => 아래에서 위로 올라오는 형태
        //self.present(registerViewController, animated: true,completion: nil)
        //오른쪽에서 화면이 등장하길 바란다면 navigationController를 사용하여 위 기능을 구현해야함
        // 3-2. navigationController를 사용하여 구현하기
        //navigationController : 단어의 의미 그대로 내용물 없이 임베디드된 화면에 대한 navigation을 관리해줌 어떤화면을 보여주고 어떤화면으로 이동할지 결정하는 역할을 하는 컨테이너 뷰 => 수적적으로 더 상세한 내용으로 들어갈때 주로 사용됨
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
}
