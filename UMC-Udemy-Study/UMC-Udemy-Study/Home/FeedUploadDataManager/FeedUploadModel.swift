//
//  FeedUIploadModel.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/11/25.
//

// api로부터 얻어올 데이터 형태
struct FeedUploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
