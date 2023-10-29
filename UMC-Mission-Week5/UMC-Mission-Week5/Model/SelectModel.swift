//
//  ListModel.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/28.
//

import Foundation


//추가 선택 라벨 모델
struct SelectModel {
    var checkedState : Bool //체크 여부
    var itemTitle : String //추가 대상
    var itemPrice : Int //추가되는 가격
    
    init(checkedState: Bool, itemTitle: String, itemPrice: Int) {
        self.checkedState = checkedState
        self.itemTitle = itemTitle
        self.itemPrice = itemPrice
    }
}
