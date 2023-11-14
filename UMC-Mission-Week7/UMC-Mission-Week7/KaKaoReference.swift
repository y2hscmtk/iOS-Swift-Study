//
//  KaKaoReference.swift
//  UMC-Mission-Week7
//
//  Created by Choi76 on 2023/11/14.
//

import Foundation

// 카카오 계정과 관련된 작업을 수행하기 위한 싱글톤 객체
class KaKaoReference{
    
    //SingleTon Reference
    static let shared = KaKaoReference()
    
    private init() {} //외부 생성 금지
    
    
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
    
    
}
