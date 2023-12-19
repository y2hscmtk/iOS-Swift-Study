//
//  DeleteUserFeed.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/12/19.
//

import Foundation

struct DeleteUserFeed : Decodable {
    let isSuccess : Bool
    let code : Int
    let message : String
    let result : String
}
