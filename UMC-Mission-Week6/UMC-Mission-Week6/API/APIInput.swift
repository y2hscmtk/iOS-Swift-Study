//
//  APIInput.swift
//  UMC-Mission-Week6
//
//  Created by Choi76 on 2023/11/07.
//

import Foundation

//API 요청시 함께 전달할 파라미터 정보 관리
struct APIInput : Encodable {
    var limit : Int?
    var page : Int?
}


