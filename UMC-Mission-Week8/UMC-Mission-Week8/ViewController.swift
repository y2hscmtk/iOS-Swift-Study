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
    @IBOutlet weak var announceLabel: UILabel! // 로그인 성공/실패 여부 안내
    
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
        // 필요한 동작
        // 0. 사용자가 모든 텍스트에 값을 입력했는지 확인
        let id = idLabel.text ?? ""
        let pw = pwLabel.text ?? ""
        
        if id=="" || pw==""{
            announceLabel.text = "아이디와 비밀번호를 모두 입력해주세요"
            return
        }
        
        // 1. 현재 UserDefaults가 존재하는지 확인
        if let encodedData = UserDefaults.standard.data(forKey: "userInformation") {
            // 2. 언아카이빙 Data -> [User]
            if let userInforamtionArray = try? JSONDecoder().decode([User].self, from: encodedData) {
                // 사용자가 입력한 값과 일치하는 값이 있는지 확인
                for user in userInforamtionArray{
                    if user.id == id && user.pw == pw{
                        announceLabel.text = "로그인 성공! 환영합니다. \(user.id)"
                        return // 더이상 탐색 할 필요 없으므로 종료
                    }
                }
                //모든 값 탐색했음에도 값이 존재하지 않는다면, 없는 회원임
                announceLabel.text = "아이디 또는 비밀번호를 확인해주세요."
            }
            
        } else {
            // UserDafaults에 key="userInformation"으로 등록된 값이 없다면, 새로 만들기
            let userInformationArray : [User] = [] // 빈 배열로 만들기
            // 아카이빙([User] => Data)
            if let encodedData = try? JSONEncoder().encode(userInformationArray) {
                UserDefaults.standard.set(encodedData, forKey: "userInformation")
            
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    

}

