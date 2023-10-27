//
//  ViewController.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/27.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setCollectionView()
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
        
    }
    
    
    //뷰 생성시 Navigation Bar 영역 숨기기
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true) // 뷰 컨트롤러가 나타날 때 숨기기
    }

    
}

extension MainViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    //섹션별로 몇개의 셀을 보여줄 것인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //몇번째 셀에 어떤 아이템을 보여줄 것인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodTitleCollectionViewCell.identifier, for: indexPath) as? FoodTitleCollectionViewCell else{
                return UICollectionViewCell()
            }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PriceCollectionViewCell.identifier, for: indexPath) as? PriceCollectionViewCell else{
                return UICollectionViewCell()
            }
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
//        let section = indexPath.section
        
        
        //switch section{ => 섹션별 지정
        //컬렉션 뷰의 가로에 딱 맞게, 세로는 159로
        return CGSize(
            width: collectionView.frame.width,
            height: CGFloat(300))
    }
            
}
            
