//
//  DrugAPI.swift
//  UMC-Mission-Week9-Drug-Info
//
//  Created by Choi76 on 2023/12/08.
//

import Foundation
import Alamofire

// <<Reference>>
// 공공 데이터 포탈 : https://www.data.go.kr/data/15075057/openapi.do
// "식품의약품안전처_의약품개요정보(e약은요)"
// End Point : https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList


// 응답 데이터 형식
/*
 
 {
   "header": {
     "resultCode": "String",
     "resultMsg": "String"
   },
   "body": {
     "items": [ // items는 배열임
       {
         // 약품 정보 필드들...
       }
     ]
     // 기타 필드들...
   }
 }
 */


// 요청 파라미터 형식 => 인코더블 프로토콜 채택
struct DrugResponse: Decodable {
    let header: Header
    let body: Body
}

struct Header: Decodable {
    let resultCode: String
    let resultMsg: String
}

struct Body: Decodable {
    let items: [DrugItem] // 결과값이 여러개 존재할 경우, 배열의 형태로 전달받음
}

// API로부터 전달받을 알약 클래스
struct DrugItem: Decodable {
    let itemImage: String? // 알약 이미지 링크 (옵셔널)
    let itemName: String // 알약 이름
    let entpName: String // 알약 제조사
    let efcyQesitm: String? // 알약 효능 요약 (옵셔널)
    let useMethodQesitm: String? // 복용 방법 (옵셔널)
    let depositMethodQesitm: String? // 보관 방법 (옵셔널)
}


struct APIParameter : Encodable{
    let ServiceKey = "mnM3G+Ve2TbLbL8c28uo0+8DPm1BWhypecdlULvO0JON8yo7ml/Crna3jiAd5vo9sM2U67ohzK8DWVt5xdPBnA==" // decoding
    //let ServiceKey = "mnM3G%2BVe2TbLbL8c28uo0%2B8DPm1BWhypecdlULvO0JON8yo7ml%2FCrna3jiAd5vo9sM2U67ohzK8DWVt5xdPBnA%3D%3D" // encoding
    var pageNo : Int = 1
    var numOfRows : Int = 10 //얻어올 결과값 개수
    var efcyQesitm : String
    let type = "json"
    init(pageNo: Int = 1, numOfRows: Int = 10, efcyQesitm: String) {
        self.pageNo = pageNo
        self.numOfRows = numOfRows
        self.efcyQesitm = efcyQesitm
    }
}

// Alamofire를 활용하여 API코드 작성
class DrugAPI{
    static let shared = DrugAPI()
    
    let url = "https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"
    
    // 알약 검색 => 파라미터를 매개변수로 받아서 요청
    func searchDrug(_ parameter : APIParameter, _ viewController : DrugSearchViewController){
        AF.request(url, method: .get, parameters: parameter)
            .validate()
            .responseDecodable(of: DrugResponse.self) { response in
                switch response.result {
                case .success(let drugResponse):
                    let searchResult = drugResponse.body.items
                    // print("Drug Response: \(drugResponse)")
                    print("DrugInfo List : \(searchResult)")
                    viewController.setSearchResultArray(searchResult: searchResult)
                case .failure(let error):
                    print("API 요청 실패: \(error.localizedDescription)")
                }
            }
    }
    
    // 결과물 확인을 위한 테스트
    func searchDrugTest(_ parameter: APIParameter) {
        AF.request(url, method: .get, parameters: parameter)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    print("Raw Data: \(String(data: data, encoding: .utf8) ?? "Invalid data")")
                case .failure(let error):
                    print("API 요청 실패: \(error.localizedDescription)")
                }
            }
    }
    
    
    
}
