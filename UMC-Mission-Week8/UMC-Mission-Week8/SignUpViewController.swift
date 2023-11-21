//
//  SignUpViewController.swift
//  UMC-Mission-Week8
//
//  Created by Choi76 on 2023/11/20.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var userInputId: UITextField! //사용자가 입력한 아이디
    @IBOutlet weak var userInputPW: UITextField! //사용자가 입력한 비밀번호
    @IBOutlet weak var announceLabel: UILabel! //로그인 실패 성공 여부알림
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 회원가입 버튼 클릭시
    @IBAction func btnSignUpdidTapped(_ sender: Any) {
        // 사용자가 입력한 값이 존재하는지 확인
        let id = userInputId.text ?? ""
        let pw = userInputPW.text ?? ""
        
        if id=="" || pw==""{
            announceLabel.text = "아이디와 비밀번호를 모두 입력해주세요"
            return
        }
        
        // UserDefaults로부터 기존에 등록된 값들 확인
        // 언아카이빙을 위해 data타입으로 불러오기
        if let encodedData = UserDefaults.standard.data(forKey: "userInformation"){ // if userDefaults has a value
            // 언아카이빙 : Data => [User]
            if var userInformationArray = try? JSONDecoder().decode([User].self, from: encodedData){
                
                for user in userInformationArray {
                    if user.id == id{ //아이디가 존재한다면
                        announceLabel.text = "이미 존재하는 아이디입니다."
                        return // 종료
                    }
                }
                // 일치하는 아이디가 없다면 회원가입 허용
                // 1. 기존 배열에 새로운 값을 삽입하고
                userInformationArray.append(User(id: id, pw: pw))
                // 2. 아카이빙
                if let encodingData = try? JSONEncoder().encode(userInformationArray) {
                    UserDefaults.standard.set(encodingData, forKey: "userInformation")
                    announceLabel.text = "회원가입이 완료되었습니다."
                }
            }
            
        } else { // if userDefaults is nil type (empty)
            //UserDefaults에 배열이 존재하지 않는다면, 해당 회원을 추가한 빈 배열 삽입하기
            let userInformation : [User] = [User(id: id, pw: pw)] //User를 담을 수 있는 빈 배열 생성
            if let encoded = try? JSONEncoder().encode(userInformation) { //JSonEncoder를 사용하여 데이터 배열로 아카이빙
                UserDefaults.standard.set(encoded, forKey: "userInformation") // 배열에 값 삽입
                announceLabel.text = "회원가입이 완료되었습니다."
            }
        }
    }
}
