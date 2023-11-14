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


//Kakao Login Document
//https://developers.kakao.com/docs/latest/ko/kakaologin/ios#login-with-kakaoaccount

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
                    print("oauthToken : \(String(describing: oauthToken))")
                    
                    
                    // 로그인 성공시 사용자 정보 가져오기
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        } else if let userInfo = KaKaoReference.shared.extractUserInfo(user) {
                            
                            /*
                             //print("user Information : \(String(describing: userInfo))")
                             user Information : Optional(KakaoSDKUser.User(id: Optional(3161942434),
                             properties: Optional(["thumbnail_image": "https://k.kakaocdn.net/dn/cwepDk/btrX3ZvZSwU/FiZQcmjfVaogHsB3k9SwDk/img_110x110.jpg", "profile_image": "https://k.kakaocdn.net/dn/cwepDk/btrX3ZvZSwU/FiZQcmjfVaogHsB3k9SwDk/img_640x640.jpg", "nickname": "최강"]), kakaoAccount: Optional(KakaoSDKUser.Account(profileNeedsAgreement: nil, profileNicknameNeedsAgreement: Optional(false), profileImageNeedsAgreement: Optional(false), profile: Optional(KakaoSDKUser.Profile(nickname: Optional("최강"), profileImageUrl: Optional(https://k.kakaocdn.net/dn/cwepDk/btrX3ZvZSwU/FiZQcmjfVaogHsB3k9SwDk/img_640x640.jpg), thumbnailImageUrl: Optional(https://k.kakaocdn.net/dn/cwepDk/btrX3ZvZSwU/FiZQcmjfVaogHsB3k9SwDk/img_110x110.jpg), isDefaultImage: Optional(false))), nameNeedsAgreement: nil, name: nil, emailNeedsAgreement: nil, isEmailValid: nil, isEmailVerified: nil, email: nil, ageRangeNeedsAgreement: nil, ageRange: nil, birthyearNeedsAgreement: nil, birthyear: nil, birthdayNeedsAgreement: nil, birthday: nil, birthdayType: nil, genderNeedsAgreement: nil, gender: nil, phoneNumberNeedsAgreement: nil, phoneNumber: nil, ciNeedsAgreement: nil, ci: nil, ciAuthenticatedAt: nil, legalNameNeedsAgreement: nil, legalName: nil, legalBirthDateNeedsAgreement: nil, legalBirthDate: nil, legalGenderNeedsAgreement: nil, legalGender: nil, isKoreanNeedsAgreement: nil, isKorean: nil)), groupUserToken: nil, connectedAt: Optional(2023-11-14 01:35:22 +0000), synchedAt: nil, hasSignedUp: nil))
                            */
                            
                            print("### Extracted User Info: \(userInfo)")
                        }
                        
                    }
                    
                    
                }
            }
        
    }


}

