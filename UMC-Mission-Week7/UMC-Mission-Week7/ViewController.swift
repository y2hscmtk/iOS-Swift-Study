//
//  ViewController.swift
//  UMC-Mission-Week7
//
//  Created by Choi76 on 2023/11/13.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKUser
import KakaoSDKAuth

class ViewController: UIViewController {

    @IBOutlet weak var UIButtonLogIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UIButtonLogIn.layer.cornerRadius = 20 //테두리 깎기
    }

    
    //MARK: Kakao LogIn Button
    //카카오 계정으로 시작하기 버튼 클릭시
    @IBAction func UIButtonLogInDidClicked(_ sender: UIButton) {
        
        // 카카오톡 설치 여부 확인 => 카카오톡 앱을 통해 로그인을 구현할 경우
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoTalk() success.")
//
//                    //do something
//                    _ = oauthToken
//                }
//            }
//        }
        
        // 웹사이트에서 카카오톡 로그인 화면을 띄울 경우
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                }
            }
        
    }


}

