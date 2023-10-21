//
//  ObjectListTableViewCell.swift
//  CarrotMarket
//
//  Created by Choi76 on 2023/10/04.
//

import UIKit

//물건을 가로 리스트 형태로 보여주기 위함 => 컬렉션뷰의 컨테이너 역할을 수행할 예정
class ObjectListTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //테이블뷰에서 위임처리를 하기 위한 함수
    func setCollectionViewDataSourceDelegate(dataSourceDelegate : UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int){
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        
        //컬렉션뷰로 사용할 nib파일 등록
        let storyNib = UINib(nibName: "ObjectListCollectionViewCell", bundle: nil)
        collectionView.register(storyNib, forCellWithReuseIdentifier: "ObjectListCollectionViewCell")
        
        //컬렉션뷰의 flowlayout을 horizontal로 변경(가로로 스크롤 가능하도록)
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal //스크롤 방향 설정
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10) //셀 간의 간격 설정
        flowlayout.minimumLineSpacing = 5 //떨어져있는 간격 설정
        collectionView.collectionViewLayout = flowlayout //collectionView의 레이아웃 설정
        
        
        //등록이 완료됐을때, 다시한번 리로드
        collectionView.reloadData() //컬렉션뷰 새로고침
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //collectionView에 대한 delegate와 datasource를 위임해야함 => 함수로 해결
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
