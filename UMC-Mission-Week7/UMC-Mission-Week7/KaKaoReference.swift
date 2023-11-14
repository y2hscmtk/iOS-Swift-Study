//
//  KaKaoReference.swift
//  UMC-Mission-Week7
//
//  Created by Choi76 on 2023/11/14.
//

import Foundation

// Kakao api pod file
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

// 카카오 계정과 관련된 작업을 수행하기 위한 싱글톤 객체
class KaKaoReference{
    
    //SingleTon Reference
    static let shared = KaKaoReference()
    
    private init() {} //외부 생성 금지
    
    //사용자 정보 추출
    func extractUserInfo(_ userInfo: User?) -> [String: Any]? {
        print("call extractUserInfo")
        guard let userInfo = userInfo, let properties = userInfo.properties else {
            print("extractUserInfo Data binding failed")
            return nil
        }

        // 딕셔너리로 추출한 데이터 반환
        var extractedInfo: [String: Any] = [:]
        extractedInfo["nickname"] = properties["nickname"]
        extractedInfo["profileImage"] = properties["profile_image"]
        extractedInfo["thumbnailImage"] = properties["thumbnail_image"]
        //닉네임, 프로필이미지, 썸네일이미지 반환
        return extractedInfo
    }

    
    
}
