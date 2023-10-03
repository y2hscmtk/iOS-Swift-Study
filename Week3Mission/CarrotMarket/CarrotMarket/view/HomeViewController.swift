//
//  HomeViewController.swift
//  CarrotMarket
//
//  Created by Choi76 on 2023/10/03.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var writeButton: UIView!
    
    var objectList: [ObjectStruct] = []
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //테이블 뷰의 위임자로, HomeViewController선정
        tableView.delegate = self
        tableView.dataSource = self
        
        //보여줄 셀의 Nib정보를 tableview에 등록(레이아웃 등록?)
        let objectCell = UINib(nibName: "ObjectTableViewCell", bundle: nil)
        tableView.register(objectCell, forCellReuseIdentifier: "ObjectTableViewCell")
        
        writeButton.layer.cornerRadius = 25
        //writeButton.addSubview(<#T##view: UIView##UIView#>)
        self.view.bringSubviewToFront(self.writeButton)

        // 구조체 인스턴스 추가
        objectList.append(ObjectStruct(imageName: "object_1", objectTitle: "고사양 게이밍PC 거의 새제품", objectUploadDate: "송파구 잠실6동 10초전", objectPrice: "9억 9999만 9999원", heartCount: "1"))
        objectList.append(ObjectStruct(imageName: "object_2", objectTitle: "최그급 한우세트 팝니다!!", objectUploadDate: "송파구 잠실동 3분전", objectPrice: "100,000", heartCount: "1"))
        objectList.append(ObjectStruct(imageName: "object_3", objectTitle: "맥북에어m2 미드나이트 풀박", objectUploadDate: "송파구 천호동 3시간전", objectPrice: "120만원", heartCount: "1"))
        objectList.append(ObjectStruct(imageName: "object_4", objectTitle: "지샥 스퀘어 gw-5000 구메코 팝니다", objectUploadDate: "송파구 잠실동 1일전", objectPrice: "250,000", heartCount: "1"))
        objectList.append(ObjectStruct(imageName: "object_5", objectTitle: "애플 올드맥 아이맥G3 레트로", objectUploadDate: "서울특별시 송파구 4일전", objectPrice: "350,000", heartCount: "1"))
        objectList.append(ObjectStruct(imageName: "object_6", objectTitle: "투미 리에종 토트백(새상품)", objectUploadDate: "서울특별시 강남구 5일전", objectPrice: "580,000", heartCount: "1"))
        objectList.append(ObjectStruct(imageName: "object_7", objectTitle: "맥북에어 m1 영문키보드", objectUploadDate: "송파구 송파동 5일전", objectPrice: "700,000", heartCount: "1"))
        objectList.append(ObjectStruct(imageName: "object_8", objectTitle: "지방시 안티고나 미듐 토트백", objectUploadDate: "송파구 방이2동 6일전", objectPrice: "650,000", heartCount: "1"))
    }
    
}
//각 셀에 보여줄 정보를 나타내기 위한 구조체 작성
struct ObjectStruct{
    let imageName: String //보여줄 이미지의 이름
    let objectTitle: String //물건 판매 제목 "~팝니다"
    let objectUploadDate: String //물건 업로드 시간
    let objectPrice: String //물건 판매 가격
    let heartCount: String //하트 수
    //생성자 정의
    init(imageName: String, objectTitle: String, objectUploadDate: String, objectPrice: String, heartCount: String) {
        self.imageName = imageName
        self.objectTitle = objectTitle
        self.objectUploadDate = objectUploadDate
        self.objectPrice = objectPrice
        self.heartCount = heartCount
    }
}


//테이블 뷰 기능 확장
extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    //총 몇개의 셀을 보여줄 것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectList.count //물건리스트에 삽입한 개수만큼
    }
    
    
    //어떤 모습의 셀을 보여줄 것인지
    //각 셀에 대한 정보 주입도 이 함수에서 수행
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.backgroundColor = .blue
//        return cell
        //식별자로 보여줄 셀 찾기
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectTableViewCell", for: indexPath) as? ObjectTableViewCell else{
            return UITableViewCell() //해당하는 셀이 없는 경우 일반 테이블 뷰 리턴
        }
        //해당 셀에 정보 주입 => 각 셀에 해당하는 정보 주입
        let image = UIImage(named: self.objectList[indexPath.row].imageName)
        cell.imageViewObjectImage.image = image
        cell.labelObjectTitle.text = self.objectList[indexPath.row].objectTitle
        cell.labelObjectUploadDate.text = self.objectList[indexPath.row].objectUploadDate
        cell.labelObjectPrice.text = self.objectList[indexPath.row].objectPrice
        
        
        
        return cell //식별자에 해당하는 셀을 찾았을 경우 해당 셀 리턴
    }
    
}
