//
//  ProfileViewController.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/21.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()

    }
    
    // MARK: - Actions
    
    
    // MARK: - Helpers
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //사용할 컬렉션 뷰 셀 등록
        collectionView.register(
            UINib(nibName: "ProfileCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
    }

}

extension ProfileViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    
    //화면에 보여질 셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //사용할 셀 불러오기
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProfileCollectionViewCell.identifier,
            for: indexPath) as? ProfileCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell //성공시
    }
    
    
}

//컬렉션 뷰의 셀 사이즈 조절 => 테이블 뷰와 다른 방식을 사용함
extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        <#code#>
    }
}
