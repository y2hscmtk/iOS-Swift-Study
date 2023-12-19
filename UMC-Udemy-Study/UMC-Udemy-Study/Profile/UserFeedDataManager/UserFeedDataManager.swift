//
//  FeedDataManager.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/12/17.
//
import Alamofire

//https://docs.google.com/spreadsheets/d/1Ozj6B02u0F15afo9tH5apbRYlEiJpg4I756fPgyYP0M/edit#gid=681261528

//Header, Body 없음 => 요청 파라미터 없음

class UserFeedDataManager {
    
    //MARK: 사용자 피드 조회 API
    func getUserFeed(_ viewController : ProfileViewController, // 결과값 받아오기 위함
                     _ userID : Int = 2){ // 실제 앱에서는 이 부분에 사용자 아이디를 받아와야함
        // 통신
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: UserFeedModel.self) { response in
            switch response.result{
            case .success(let result):
                print("성공 \(result)")
                viewController.successFeedAPI(result) // 결과물 반환
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: 게시물 삭제 API
    func deleteUserFeed(_ viewController : ProfileViewController, // 결과값 받아오기 위함
                     _ postIdx : Int = 2){
        // 통신
        AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)/status",
                   method: .patch, // 방식은 patch방식으로
                   parameters: nil)
        .validate()
        .responseDecodable(of: DeleteUserFeed.self) { response in // DeleteUserFeed모델로 받아오기
            switch response.result{
            case .success(let result):
                print("DEBUG \(result)")
                viewController.successsDeletePostAPI(result.isSuccess ?? false) // 디폴트는 false로 지정
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
