//
//  ReelsViewController.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/12/19.
//

import UIKit

class ReelsViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setCollectionView()
    }
    
    func setCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 닙 등록
        collectionView.register(UINib(nibName: "ReelsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ReelsCollectionViewCell.identifier)
    }
    
    

}

extension ReelsViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCollectionViewCell.identifier, for: indexPath) as? ReelsCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    

}

// 셀 크기 지정
extension ReelsViewController : UICollectionViewDelegateFlowLayout {
    // 셀 1개의 크기가 컬렉션뷰의 크기에 맞도록
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    // 셀 간의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}
