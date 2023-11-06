//
//  FeedDataManger.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/11/06.
//

import Foundation
import Alamofire

class FeedDataManager {
    func feedDataManager(_ parameters : FeedAPIInput){
        AF.request("https://api.thecatapi.com/v1/images/search",method: .get,parameters: parameters)
            .validate()
            .responseDecodable(of: [FeedModel].self) {
                response in
                switch response.result{
                case .success(let result):
                    print("성공")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
