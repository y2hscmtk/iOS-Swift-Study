//
//  Drug.swift
//  UMC-Mission-Week9-Drug-Info
//
//  Created by Choi76 on 2023/12/09.
//
import Foundation

// API로부터 전달받을 알약 클래스
class Drug : Codable {
    let itemImage : String // 알약 이미지 링크
    let itemName : String // 알약 이름
    let entpName : String // 알약 제조사
    let efcyQesitm : String // 알약 효능 요약
    let useMethodQesitm : String // 복용 방법
    let depositMethodQesitm : String // 보관 방법
    // 생성자
    init(itemImage: String, itemName: String, entpName: String, efcyQesitm: String, useMethodQesitm: String, depositMethodQesitm: String) {
        self.itemImage = itemImage
        self.itemName = itemName
        self.entpName = entpName
        self.efcyQesitm = efcyQesitm
        self.useMethodQesitm = useMethodQesitm
        self.depositMethodQesitm = depositMethodQesitm
    }
}
