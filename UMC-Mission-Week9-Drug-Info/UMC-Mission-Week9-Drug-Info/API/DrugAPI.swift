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

// 요청 파라미터 형식 => 인코더블 프로토콜 채택
struct APIParameter : Encodable{
    let ServiceKey = "2WViM7iz3KBbjBYg1Sdx%2F1CyuPVh6hYyTUlXTUtquW8ioxx5MXpxy4mC9NXfLpZ2P5HeShlohQLOA8xGVeSZ0Q%3D%3D"
    var pageNo : Int = 1
    var numOfRows : Int = 10 //얻어올 결과값 개수
    var efcyQesitm : String
    let type = "json"
    init(pageNo: Int, numOfRows: Int, efcyQesitm: String) {
        self.pageNo = pageNo
        self.numOfRows = numOfRows
        self.efcyQesitm = efcyQesitm
    }
}

// Alamofire를 활용하여 API코드 작성 필요
class DrugAPI{
    static let shared = DrugAPI()
    
    let url = "https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"
    
    // 알약 검색 => 파라미터를 매개변수로 받아서 요청
    func searchDrug(_ parameter : APIParameter){
        AF.request(url,method: .get,parameters: parameter)
            .validate()
            .response{ response in
                print(response)
            }
    }
    
    
    
}
