//
//  ViewController.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/27.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    
    
    //피자사이즈선택 관련 모델
    static var pizzaSizeSelectList : [SelectModel] = [
        SelectModel(checkedState: false, itemTitle: "M", itemPrice: "+0원"),
        SelectModel(checkedState: false, itemTitle: "L", itemPrice: "+3,000"),
    ]

    
    //도우 추가 선택
    var dowSelectList : [SelectModel] = [
        SelectModel(checkedState: false, itemTitle: "체다크러스트 추가", itemPrice: "+3,000원"),
        SelectModel(checkedState: false, itemTitle: "고구마크러스트 추가", itemPrice: "+3,500원"),
        SelectModel(checkedState: false, itemTitle: "치즈크러스트 추가", itemPrice: "+3,500원"),
        SelectModel(checkedState: false, itemTitle: "골든크러스트 추가", itemPrice: "+4,500원"),
    ]
    
    //토핑 추가 선택
    var toppingSelectList : [SelectModel] = [
        SelectModel(checkedState: false, itemTitle: "매운맛 반 추가", itemPrice: "+3,000원"),
        SelectModel(checkedState: false, itemTitle: "올리브 추가", itemPrice: "+3,500원"),
        SelectModel(checkedState: false, itemTitle: "파인애플 추가", itemPrice: "+3,500원"),
        SelectModel(checkedState: false, itemTitle: "할라피뇨 추가", itemPrice: "+4,500원"),
        SelectModel(checkedState: false, itemTitle: "소불고기 추가", itemPrice: "+4,500원"),
        SelectModel(checkedState: false, itemTitle: "베이컨 추가", itemPrice: "+4,500원"),
    ]
    
    //음료 추가 선택
    var drinkSelectList : [SelectModel] = [
        SelectModel(checkedState: false, itemTitle: "코카콜라 500ml 추가", itemPrice: "+3,000원"),
        SelectModel(checkedState: false, itemTitle: "스프라이트 500ml 추가", itemPrice: "+3,500원"),
    ]
    
    
    //추가선택 관련 메뉴들
    var selectMenuList : [SelectMenuModel] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setCollectionView()
        //화면에 보여줄 추가선택 관련 데이터
        selectMenuList.append(SelectMenuModel(selectTitle: "도우 추가선택", maxSelectCount: 1, selectList: dowSelectList))
        selectMenuList.append(SelectMenuModel(selectTitle: "토핑 추가선택", maxSelectCount: 3, selectList: toppingSelectList))
        selectMenuList.append(SelectMenuModel(selectTitle: "음료 추가선택", maxSelectCount: 2, selectList: drinkSelectList))
    }

    //컬렉션 뷰 초기화
    func setCollectionView(){
        collectionview.delegate = self
        collectionview.dataSource = self
        
        //사용할 셀 등록
        //0번째 셀
        collectionview.register(
            UINib(nibName: "FoodTitleCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: FoodTitleCollectionViewCell.identifier)
        
        //1번째 셀
        collectionview.register(
            UINib(nibName: "PriceCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: PriceCollectionViewCell.identifier)
        
        //나머지 셀(선택 관련 셀)
        collectionview.register(
            UINib(nibName: "OtherCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: OtherCollectionViewCell.identifier)
        
        //마지막 셀(수량 선택)
        collectionview.register(
            UINib(nibName: "SelectCountCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: SelectCountCollectionViewCell.identifier)
        
        
    }
    
    
    //뷰 생성시 Navigation Bar 영역 숨기기
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true) // 뷰 컨트롤러가 나타날 때 숨기기
    }

    
}

extension MainViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    //섹션별로 몇개의 셀을 보여줄 것인지 //현재는 1개의 섹션(default)만을 사용
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    //몇번째 셀에 어떤 아이템을 보여줄 것인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodTitleCollectionViewCell.identifier, for: indexPath) as? FoodTitleCollectionViewCell else{
                return UICollectionViewCell()
            }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PriceCollectionViewCell.identifier, for: indexPath) as? PriceCollectionViewCell else{
                return UICollectionViewCell()
            }
            cell.menuList = MainViewController.pizzaSizeSelectList
            return cell
        case 5:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCountCollectionViewCell.identifier, for: indexPath) as? SelectCountCollectionViewCell else{
                return UICollectionViewCell()
            }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OtherCollectionViewCell.identifier, for: indexPath) as? OtherCollectionViewCell else{
                return UICollectionViewCell()
            }
            
            let selectMenuItem = self.selectMenuList[indexPath.row-2]
            //cell.setItem(itemList: self.itemList[indexPath.row-2]) //보여줄 아이템 데이터 값 할당
            cell.selectTitleLabel.text = selectMenuItem.selectTitle
            cell.maxSelectLabel.text = "최대 \(selectMenuItem.maxSelectCount)개 선택"
            cell.itemList = selectMenuItem.selectList
            return cell
        }
        
    }
}

//셀의 크기 지정
extension MainViewController : UICollectionViewDelegateFlowLayout{
    
    
    //CGSize를 리턴함 => 셀에 따라서 다른 크기를 리턴해야함
    //=> 셀은 섹션에 소속되어있음 => 섹션을 확인하고 맞춰서 크기 지정필요
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let index = indexPath.row
        
        
        //switch section{ => 섹션별 지정
        //컬렉션 뷰의 가로에 딱 맞게, 세로는 159로
        //세로 높이는 해당에 들어있는 아이템의 높이만큼 바뀌어야함
        switch index{
        case 0: //메뉴 이미지 + 메뉴 소개란
            return CGSize(
                width: collectionView.frame.width,
                height: CGFloat(300))
        case 1: //사이즈 선택란(피자 사이즈 선택)
            return CGSize(
                width: collectionView.frame.width,
                height: CGFloat(MainViewController.pizzaSizeSelectList.count*50 + 30)) //30는 윗부분 50은 셀 하나의 높이
        case 5:
            return CGSize(
                width: collectionView.frame.width,
                height: CGFloat(80))
        default: //나머지 셀은 모두 동일한 셀을 사용함
            return CGSize(
                width: collectionView.frame.width,
                height: CGFloat(self.selectMenuList[indexPath.row-2].selectList.count*50 + 39)) //39는 윗부분 50은 셀 하나의 높이
        }
        
    }
            
}
            
