//
//  HomeViewController.swift
//  CarrotMarket
//
//  Created by Choi76 on 2023/10/03.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var writeButton: UIButton!
    
    var objectList: [ObjectStruct] = []
    
    var objectHorizontalList: [ObjectHorizontalStruct] = []
    
    var randomValue = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //테이블 뷰의 위임자로, HomeViewController선정
        tableView.delegate = self
        tableView.dataSource = self
        
        //보여줄 셀의 Nib정보를 tableview에 등록(레이아웃 등록?)
        let objectCell = UINib(nibName: "ObjectTableViewCell", bundle: nil)
        tableView.register(objectCell, forCellReuseIdentifier: "ObjectTableViewCell")
        
        //가로 물건 리스트 셀의 nib정보 등록
        let storyNib = UINib(nibName: "ObjectListTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "ObjectListTableViewCell")
        
//        writeButton.backgroundColor = .black
        
       
//        writeBtnstackView.addArrangedSubview(writeBtnLabel)
//        writeBtnstackView.addArrangedSubview(writeBtnLabel2)
//        writeButton.addSubview(writeBtnstackView)
        
        self.view.bringSubviewToFront(self.writeButton) //맨 앞으로 가져오기 => 테이블 뷰 뒤에 가려지지 않도록

        // 구조체 인스턴스 추가
        objectList.append(ObjectStruct(imageName: "object_1", objectTitle: "고사양 게이밍PC 거의 새제품", objectUploadDate: "송파구 잠실6동 10초전", objectPrice: "9억 9999만 9999원", heartCount: "23"))
        objectList.append(ObjectStruct(imageName: "object_2", objectTitle: "최그급 한우세트 팝니다!!", objectUploadDate: "송파구 잠실동 3분전", objectPrice: "100,000", heartCount: "10"))
        objectList.append(ObjectStruct(imageName: "object_3", objectTitle: "맥북에어m2 미드나이트 풀박", objectUploadDate: "송파구 천호동 3시간전", objectPrice: "120만원", heartCount: "12"))
        objectList.append(ObjectStruct(imageName: "object_4", objectTitle: "지샥 스퀘어 gw-5000 구메코 팝니다", objectUploadDate: "송파구 잠실동 1일전", objectPrice: "250,000", heartCount: "11"))
        objectList.append(ObjectStruct(imageName: "object_5", objectTitle: "애플 올드맥 아이맥G3 레트로", objectUploadDate: "서울특별시 송파구 4일전", objectPrice: "350,000", heartCount: "45"))
        objectList.append(ObjectStruct(imageName: "object_6", objectTitle: "투미 리에종 토트백(새상품)", objectUploadDate: "서울특별시 강남구 5일전", objectPrice: "580,000", heartCount: "1"))
        objectList.append(ObjectStruct(imageName: "object_7", objectTitle: "맥북에어 m1 영문키보드", objectUploadDate: "송파구 송파동 5일전", objectPrice: "700,000", heartCount: "14"))
        objectList.append(ObjectStruct(imageName: "object_8", objectTitle: "지방시 안티고나 미듐 토트백", objectUploadDate: "송파구 방이2동 6일전", objectPrice: "650,000", heartCount: "21"))
        
        
        //가로 물건 셀에 대한 인스턴스 추가
        objectHorizontalList.append(ObjectHorizontalStruct(imageName: "collection_object_1", objectTitle: "대천 김 곱창김 팝니다.", objectPrice: "28,000원"))
        objectHorizontalList.append(ObjectHorizontalStruct(imageName: "collection_object_2", objectTitle: "하이런 국산와 팝니다.", objectPrice: "30,000원"))
        objectHorizontalList.append(ObjectHorizontalStruct(imageName: "collection_object_3", objectTitle: "타이틀 리스트 단돈 85000원", objectPrice: "85,000원"))
        
        randomValue = Int.random(in: 0...5)
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


//가로 셀에 보여줄 정보를 나타내기 위한 구조체 작성
struct ObjectHorizontalStruct{
    let imageName: String //보여줄 이미지의 이름
    let objectTitle: String //물건 판매 제목 "~팝니다"
    let objectPrice: String //물건 판매 가격
    init(imageName: String, objectTitle: String, objectPrice: String) {
        self.imageName = imageName
        self.objectTitle = objectTitle
        self.objectPrice = objectPrice
    }
}

//테이블 뷰 기능 확장
extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    //총 몇개의 셀을 보여줄 것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectList.count+1 //물건리스트에 삽입한 개수만큼
    }
    
    
    //어떤 모습의 셀을 보여줄 것인지
    //각 셀에 대한 정보 주입도 이 함수에서 수행
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //randomValue미만, randomValue+1이상의 값에 대해서는 ObjectTableViewCell를 식별자로
        if indexPath.row < randomValue{
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
            cell.labelHeartCount.text = self.objectList[indexPath.row].heartCount
            
            return cell
        } else if indexPath.row == randomValue { // randomValue라면 ObjectListTableViewCell를 식별자로 지정
            //가로로 물건들을 보여주기 위한 셀
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectListTableViewCell", for: indexPath) as? ObjectListTableViewCell else{
                return UITableViewCell()
            }
            return cell
        } else {
            //식별자로 보여줄 셀 찾기
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectTableViewCell", for: indexPath) as? ObjectTableViewCell else{
                return UITableViewCell() //해당하는 셀이 없는 경우 일반 테이블 뷰 리턴
            }
            //해당 셀에 정보 주입 => 각 셀에 해당하는 정보 주입
            let image = UIImage(named: self.objectList[indexPath.row-1].imageName)
            cell.imageViewObjectImage.image = image
            cell.labelObjectTitle.text = self.objectList[indexPath.row-1].objectTitle
            cell.labelObjectUploadDate.text = self.objectList[indexPath.row-1].objectUploadDate
            cell.labelObjectPrice.text = self.objectList[indexPath.row-1].objectPrice
            cell.labelHeartCount.text = self.objectList[indexPath.row-1].heartCount
            
            return cell
        }
        
    }
    
    //생성될 셀의 높이 600으로 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //스토리를 보여주기 위한 0번째 셀의 경우에는 높이를 80으로 설정
        if indexPath.row == randomValue{
            return 220
        }
        return 120
    }
    
    //셀이 보여질 때 호출되는 함수
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //StoryTableViewCell은 테이블 뷰 내부에서, 스토리 컬렉션 뷰를 보여주기 위한 Cell에 해당
        //셀이 보여질때, StoryTableViewCell타입으로 다운캐스팅하여 불러온 후, delegate를 해주기 위함
        guard let objectListTableViewCell = cell as? ObjectListTableViewCell else {
            return
        }
        //tableView.delegate = self에 해당함
        //tableView 내부의 CollectionView에서 delegate를 HomeViewController로 설정하는 것이 불가능하기 때문에
        //셀이 생성되기 전에 사전에 작성해둔 StoryTableViewCell의 setCollection..함수를 호출하는 것임 => 이를 통해 컬렉션뷰의 delegate를 self(HomeViewController로 지정이 가능함)
        objectListTableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

//컬렉션뷰의 기능을 사용하기 위해, 컬렉션뷰 프로토콜을 확장
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //몇개의 셀을 보여줄 것인지 => 컬렉션뷰에서
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectHorizontalList.count //가로 물건 셀의 개수만큼
    }
    
    //어떤 셀을 보여줄 것인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //컬렉션 뷰에서 사용할 셀 가져오기 => StoryCollectionViewCell 라는 식별자를 통해 컬렉션뷰의 셀을 가져온다.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ObjectListCollectionViewCell", for: indexPath) as? ObjectListCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        //가져온 셀에 정보 주입
        cell.objectImage.image = UIImage(named: objectHorizontalList[indexPath.row].imageName)
        cell.objectPrice.text = objectHorizontalList[indexPath.row].objectPrice
        cell.objectName.text = objectHorizontalList[indexPath.row].objectTitle
        return cell
    }
    
    
    //컬렉션뷰는 반드시 높이와 너비를 설정해야함
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 200) //140x200크기로 설정
    }
    
}
