//
//  FeedDataManger.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/11/06.
//
import Alamofire

//서버로 요청하기 위한 클래스
//전달받은 결과 값을 우리가 작성한 데이터모델의 형태로 디코딩하여 저장(원하는 값만 빼서 저장)

class FeedDataManager {
    func feedDataManager(_ parameters : FeedAPIInput, _ homeViewController : HomeViewController){
        
        // DispatchGroup을 사용하여 인위적으로 딜레이 생성 => LoadingShimmer 확인용
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) { // 1초 후에
            dispatchGroup.leave() // 딜레이 그룹을 떠나 알림을 발생시킵니다.
        }
        
        //dispatchGroup => LoadingShimmer확인을 위해 3초간 대기
        dispatchGroup.notify(queue: .main) {
            AF.request("https://api.thecatapi.com/v1/images/search",
                       method: .get, parameters: parameters)
            .validate()
            .responseDecodable(of: [FeedModel].self) { response in
                switch response.result{
                case .success(let result):
                    print("성공 \(result)")
                    homeViewController.apiSuccess(catArray: result)//결과물 HomeViewController의 리스트에 할당
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
