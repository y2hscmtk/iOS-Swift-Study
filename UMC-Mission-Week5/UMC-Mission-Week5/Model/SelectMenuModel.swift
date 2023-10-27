//
//  SelectMenuModel.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/28.
//

import Foundation

struct SelectMenuModel{
    var selectTitle : String // ~ 추가 선택
    var maxSelectCount : Int //최대 n개 선택
    var selectList : [SelectModel] //선택 가능한 메뉴들
    init(selectTitle: String, maxSelectCount: Int, selectList: [SelectModel]) {
        self.selectTitle = selectTitle
        self.maxSelectCount = maxSelectCount
        self.selectList = selectList
    }
}
