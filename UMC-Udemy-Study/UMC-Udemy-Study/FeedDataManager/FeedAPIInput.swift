//
//  FeedAPIInput.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/11/06.
//

import Foundation

//인코딩용
struct FeedAPIInput : Encodable {
    var limit : Int?
    var page : Int?
}
