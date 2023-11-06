//
//  FeedModel.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/11/06.
//

import Foundation

//서버로부터 전달받은 값을 저장하기 위한 구조체 작성
//전달받은 값의 형태
/*
 {
   "id": "72p",
   "url": "https://cdn2.thecatapi.com/images/72p.jpg",
   "width": 500,
   "height": 333
 }
 */
//위 데이터 중 관심있는 정보는 id와 url 뿐이므로, 아래와 같이 디코더블 프로토콜을 상속받은 구조체를 작성했다.
struct FeedModel : Decodable {
    var id : String?
    var url : String?
}
