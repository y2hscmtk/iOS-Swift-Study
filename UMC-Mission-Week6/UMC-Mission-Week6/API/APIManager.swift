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
        
        // LoadingShimmer 확인용
        // DispatchGroup을 사용하여 인위적으로 딜레이 생성
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) { // 2초동안 딜레이 발생
            dispatchGroup.leave() // 딜레이 그룹을 떠나 알림 발생
        }
        
        //dispatchGroup에서 알림 발생시 서버 요청
        dispatchGroup.notify(queue: .main) {
            AF.request("https://api.thecatapi.com/v1/images/search",
                       method: .get, parameters: parameters)
            .validate()
            .responseDecodable(of: [CatModel].self) { response in //CatModel 배열로 얻어온 정보를 디코딩
                switch response.result{ //작업에 대한 결과
                case .success(let result):
                    print("성공 \(result)")
                    viewController.apiSuccess(result) //서버에서 받은 정보 전달
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
