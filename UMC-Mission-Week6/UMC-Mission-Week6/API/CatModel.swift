//
//  CatModel.swift
//  UMC-Mission-Week6
//
//  Created by Choi76 on 2023/11/07.
//

import Foundation

//서버로부터 전달받은 정보 중 원하는 정보만 디코딩하여 관리
struct CatModel : Decodable {
    var id : String?
    var url : String?
}
