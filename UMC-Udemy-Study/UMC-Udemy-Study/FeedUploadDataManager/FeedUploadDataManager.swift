//
//  FeedUploadDataManager.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/11/25.
//

import Alamofire
// API Sheet
// https://docs.google.com/spreadsheets/d/1Ozj6B02u0F15afo9tH5apbRYlEiJpg4I756fPgyYP0M/edit#gid=1785260275


class FeedUploadDataManager {
    func posts(_ viewController : HomeViewController, _ parameter : FeedupladInput){
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameter,encoder:
                    JSONParameterEncoder.default,headers: nil).validate().responseDecodable(of: FeedUploadModel.self){ response in
            switch response.result{
            case .success(let result):
                if result.isSuccess{
                    print("성공")
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
