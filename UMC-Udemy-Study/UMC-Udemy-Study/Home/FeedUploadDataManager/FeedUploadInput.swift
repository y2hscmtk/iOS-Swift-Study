//
//  FeedUploadInput.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/11/25.
//

//api의 파라미터로 전달할 값들
struct FeedupladInput : Encodable{
    var content : String?
    var postImgsUrl : [String]?
}
