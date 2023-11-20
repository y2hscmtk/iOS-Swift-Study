//
//  ViewController.swift
//  UMC-Mission-Week8
//
//  Created by Choi76 on 2023/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idLabel: UITextField! //사용자가 입력한 아이디
    @IBOutlet weak var pwLabel: UITextField! //사용자가 입력한 비밀번호
    
    
    
    // 회원 가입 버튼 클릭됨
    @IBAction func signUpBtnDidTapped(_ sender: Any) {
        // 스토리보드 아이디 찾기
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 이동할 화면 찾기
        guard let signUpViewController = storyboard
            .instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        // 화면 이동
        self.navigationController?.pushViewController(signUpViewController, animated: true)
        
    }
    
    
    @IBAction func loginBtnDidTapped(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    

}

