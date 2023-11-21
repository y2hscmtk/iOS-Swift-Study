//
//  User.swift
//  UMC-Mission-Week8
//
//  Created by Choi76 on 2023/11/20.
//
// 사용자 정보(아이디, 비밀번호)
// UserDefaults에서 아카이빙, 언아카이빙을 위하여 Codable 프로토콜 준수
struct User : Codable {
    let id : String
    let pw : String
    init(id: String, pw: String) {
        self.id = id
        self.pw = pw
    }
}
