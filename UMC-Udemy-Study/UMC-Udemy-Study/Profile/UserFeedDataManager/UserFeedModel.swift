//
//  UserFeedModel.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/12/17.
//

import Foundation

struct UserFeedModel : Decodable {
    let isSuccess : Bool?
    let code : Int?
    let message : String?
    let result : UserFeedModelResult?
}

struct UserFeedModelResult : Decodable {
    let _isMyFeed : Bool?
    let getUserInfo : GetUserInfo?
    let getUserPosts : [GetUserPosts]?
}

struct GetUserInfo : Decodable {
    let userIdx : Int?
    let nickName : String?
    let name : String?
    let profileImgUrl : String?
    let website : String?
    let introduction : String?
    let followerCount : Int?
    let followingCount : Int?
    let postCount : Int?
}

struct GetUserPosts : Decodable {
    let postIdx: Int?
    let postImgUrl: String?
}

/*
 {
     "isSuccess": true,
     "code": 1000,
     "message": "요청에 성공하였습니다.",
     "result": {
         "_isMyFeed": true,
         "getUserInfo": {
             "userIdx": 2,
             "nickName": "yeon",
             "name": "이서연",
             "profileImgUrl": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpetdoc.co.kr%2Fency%2F280&psig=AOvVaw3KSdtmbXdfDl83Xk5vyF_8&ust=1649253296117000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCLjY5riJ_fYCFQAAAAAdAAAAABAG",
             "website": null,
             "introduction": "이서연입니다.",
             "followerCount": 0,
             "followingCount": 0,
             "postCount": 2
         },
         "getUserPosts": [
             {
                 "postIdx": 446,
                 "postImgUrl": "https://firebasestorage.googleapis.com/v0/b/catstargram-d7fbf.appspot.com/o/Cat1?alt=media&token=e92d1af6-ceb3-4a0c-9ba9-acd5cf534a42"
             },
             {
                 "postIdx": 447,
                 "postImgUrl": "https://firebasestorage.googleapis.com/v0/b/catstargram-d7fbf.appspot.com/o/Cat1?alt=media&token=e92d1af6-ceb3-4a0c-9ba9-acd5cf534a42"
             }
         ]
     }
 }
 */
