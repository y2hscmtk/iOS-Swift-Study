//
//  APIManager.swift
//  UMC-Mission-Week6
//
//  Created by Choi76 on 2023/11/07.
//

import Alamofire

class APIManager {
    //AF를 활용하여 TheCatAPI로부터 정보 요청
    //APIInput은 TheCatAPI 요청시 함께 전달할 파라미터를 정의하기 위한 구조체
    func getCatData(_ parameters : APIInput, _ viewController : ViewController){
        AF.request("https://api.thecatapi.com/v1/images/search",
                   method: .get, parameters: parameters)
        .validate()
        .responseDecodable(of: [CatModel].self) { response in //CatModel 배열로 얻어온 정보를 디코딩
            switch response.result{ //작업에 대한 결과
            case .success(let result):
                print("성공 \(result)")
                viewController.apiSuccess(catArray: result)//결과물 HomeViewController의 리스트에 할당
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
