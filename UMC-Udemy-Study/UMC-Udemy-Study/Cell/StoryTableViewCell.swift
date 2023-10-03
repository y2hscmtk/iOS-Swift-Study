//
//  StoryTableViewCell.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/03.
//

import UIKit

//테이블 뷰의 0번째 셀에서, 스토리 목록을 보여주기 위한 컬렉션 뷰의 컨테이너 역할을 수행 할 셀
class StoryTableViewCell: UITableViewCell {

    //스토리를 보여주기 위한 컬렉션 뷰
    @IBOutlet weak var collectionView: UICollectionView!
    
    //문제점 : collectionView에 대한 delegate를 설정해야하지만, 테이블뷰 셀 내에서 컬렉션 뷰를 사용하기 때문에, delegate를 설정할 수 없음
    // => 함수를 작성하여 해결
    func setCollectionViewDataSourceDelegate(dataSourceDelegate : UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int){
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        
        //컬렉션뷰로 사용할 nib파일 등록
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        collectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        //컬렉션뷰의 flowlayout을 horizontal로 변경(가로로 스크롤 가능하도록)
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal //스크롤 방향 설정
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10) //셀 간의 간격 설정
        flowlayout.minimumLineSpacing = 12 //떨어져있는 간격 설정
        collectionView.collectionViewLayout = flowlayout //collectionView의 레이아웃 설정
        
        
        //등록이 완료됐을때, 다시한번 리로드
        collectionView.reloadData() //컬렉션뷰 새로고침
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
