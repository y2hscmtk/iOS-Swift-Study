//
//  FeedAPIInput.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/11/06.
//

import Foundation


//https://developers.thecatapi.com/view-account/ylX4blBYT9FaoVd6OhvR?report=bOoHBz-8t

//요청 API : https://api.thecatapi.com/v1/images/search

//요청에 필요한 파라미터 : limit,page,order,has_breeeds, ....
//위 파라미터들 중에서 limit와 page만 넣어서 요청할 예정

//API에 주입할 파라미터 정보들에 대한 구조체
struct FeedAPIInput : Encodable {
    var limit : Int?
    var page : Int?
}
