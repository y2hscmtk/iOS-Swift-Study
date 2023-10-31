//
//  ViewController.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/27.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    
    
    @IBOutlet weak var btnGoShopping: UIButton!
    
    
    //피자사이즈선택 관련 모델
    static var pizzaSizeSelectList : [SelectModel] = [
        SelectModel(checkedState: true, itemTitle: "M", itemPrice: 20000), //기본 상태
        SelectModel(checkedState: false, itemTitle: "L", itemPrice: 23000),
    ]

    //도우 추가 선택
    var dowSelectList : [SelectModel] = [
        SelectModel(checkedState: false, itemTitle: "체다크러스트 추가", itemPrice: 3000),
        SelectModel(checkedState: false, itemTitle: "고구마크러스트 추가", itemPrice: 3000),
        SelectModel(checkedState: false, itemTitle: "치즈크러스트 추가", itemPrice: 3000),
        SelectModel(checkedState: false, itemTitle: "골든크러스트 추가", itemPrice: 3000),
    ]
    
    //토핑 추가 선택
    var toppingSelectList : [SelectModel] = [
        SelectModel(checkedState: false, itemTitle: "매운맛 반 추가", itemPrice: 3000),
        SelectModel(checkedState: false, itemTitle: "올리브 추가", itemPrice: 3000),
        SelectModel(checkedState: false, itemTitle: "파인애플 추가", itemPrice: 3000),
        SelectModel(checkedState: false, itemTitle: "할라피뇨 추가", itemPrice: 3000),
        SelectModel(checkedState: false, itemTitle: "소불고기 추가", itemPrice: 4500),
        SelectModel(checkedState: false, itemTitle: "베이컨 추가", itemPrice: 4500),
    ]
    
    //음료 추가 선택
    var drinkSelectList : [SelectModel] = [
        SelectModel(checkedState: false, itemTitle: "코카콜라 500ml 추가", itemPrice: 1500),
        SelectModel(checkedState: false, itemTitle: "스프라이트 500ml 추가", itemPrice: 1500),
        SelectModel(checkedState: false, itemTitle: "코카콜라 1.5L 추가", itemPrice: 3000),
        SelectModel(checkedState: false, itemTitle: "스프라이트 1.5L 추가", itemPrice: 3000),
    ]
    
    
    //추가선택 관련 메뉴들
    var selectMenuList : [SelectMenuModel] = []
    
    
    static var foodCost : Int = 20000 //최종 가격(기본 금액은 20000원)
    static var selectedSize : String = "M" //사용자가 선택한 피자의 사이즈
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setCollectionView()
        //화면에 보여줄 추가선택 관련 데잍
        selectMenuList.append(SelectMenuModel(selectTitle: "도우 추가선택", maxSelectCount: 1, selectList: dowSelectList))
        selectMenuList.append(SelectMenuModel(selectTitle: "토핑 추가선택", maxSelectCount: 3, selectList: toppingSelectList))
        selectMenuList.append(SelectMenuModel(selectTitle: "음료 추가선택", maxSelectCount: 2, selectList: drinkSelectList))
        
        btnGoShopping.layer.cornerRadius = 6 //모서리 둥글게 변경
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
    
    
    //가격 변화 함수
    public func changeFoodCost(price:Int){
        MainViewController.foodCost += price //가격 변화시키고
        //변경할 문자열 작성
        let updatedTitle = "\(MainViewController.foodCost)원 담기"
        btnGoShopping.setTitle(updatedTitle, for: .normal) //버튼의 텍스트 변경
    }
    
    
    //담기 버튼 클릭시
    @IBAction func btnGoShoppingDidTapped(_ sender: Any) {
        print("foodCost : \(MainViewController.foodCost)")
        //화면 전환
        //1. 스토리보드 찾기
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //2. 이동할 뷰의 인스턴스 찾기(스토리보드 아이디로)
        let shoppingCartView = storyboard.instantiateViewController(withIdentifier: "ShoppingCartViewController") as! ShoppingCartViewController
        //3. 선택한 정보들 전달
        shoppingCartView.selectedPrice = MainViewController.foodCost
        shoppingCartView.selectedSize = MainViewController.selectedSize
        
        //3. navController를 활용하여 화면전환
        self.navigationController?.pushViewController(shoppingCartView, animated: true)
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
        case 0: //음식 정보 셀(음식 사진, 음식 이름, 등등)
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodTitleCollectionViewCell.identifier, for: indexPath) as? FoodTitleCollectionViewCell else{
                return UICollectionViewCell()
            }
            return cell
        case 1: // 피자 사지즈 선택 => 다른 셀로 별도로 분리했음, 불필요하다고 판단되면 나중에 OtherCell과 합쳐보기 Refactoring
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PriceCollectionViewCell.identifier, for: indexPath) as? PriceCollectionViewCell else{
                return UICollectionViewCell()
            }
            cell.mainViewControllerReference = self
            cell.maxSelectedCount = 1//최대 한개 선택 가능
            cell.menuList = MainViewController.pizzaSizeSelectList
            print("pizza cell : \(cell.menuList)")
            return cell
        case 5: //수량 선택 셀(수량 +1 하면 현재 선택한 상태 x 2 => 가격 2배
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCountCollectionViewCell.identifier, for: indexPath) as? SelectCountCollectionViewCell else{
                return UICollectionViewCell()
            }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OtherCollectionViewCell.identifier, for: indexPath) as? OtherCollectionViewCell else{
                return UICollectionViewCell()
            }
            cell.mainViewControllerReference = self //참조 넘기기
            let selectMenuItem = self.selectMenuList[indexPath.row-2]
            cell.selectTitleLabel.text = selectMenuItem.selectTitle
            cell.maxSelectLabel.text = "최대 \(selectMenuItem.maxSelectCount)개 선택"
            cell.itemList = selectMenuItem.selectList
            cell.maxSelectedCount = selectMenuItem.maxSelectCount //최대 몇개까지 선택 가능한지 여부
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
        case 5: //수량 선택 셀
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
            
