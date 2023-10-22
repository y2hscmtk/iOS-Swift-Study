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
        
        //storyboard - collectionview - Section Inset을 1씩 둠으로써 왼쪽 끝과 오른쪽 끝에 여백을 줄 수 있음
        
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
        
        //컬렉션 뷰 셀 등록
        collectionView.register(
            UINib(nibName: "PostCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
        
    }

}

extension ProfileViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    // 컬렉션 뷰에서 사용할 섹션의 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    // Cell의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //section에 따라서 셀 지정
        switch section{
        case 0: //0번째 셀의 경우에는 한개만 => 프로필 화면
            return 1
        default: //나머지 셀의 경우에는 24개 => 피드화면
            return 24
        }
    
    }
    
    
    // 화면에 보여질 셀 생성
    // Cell 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //indexPath에 따라 다른 셀을 생성해야함
        let section = indexPath.section
        
        switch section{
        case 0 : // 0번째 셀의 경우 프로필로 사용할 섹션이므로, 프로필 셀로 생성
            //사용할 셀 불러오기
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfileCollectionViewCell.identifier,
                for: indexPath) as? ProfileCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell //성공시
        default: // 다른 섹션의 경우 피드화면으로 사용할 섹션이므로, 피드 셀로 생성
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PostCollectionViewCell.identifier,
                for: indexPath) as? PostCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell //성공시
        }
        
    }
    
    
}

//컬렉션 뷰의 셀 사이즈 조절 => 테이블 뷰와 다른 방식을 사용함
//nib파일은 ui작업을 도와주는 용도일 뿐이라, nib에서 커스텀을 진행해도 반영되지 않음
//크기에 대한 작업은 프로토콜로 해야함
extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    
 
    //CGSize를 리턴함 => 셀에 따라서 다른 크기를 리턴해야함 => 셀은 섹션에 소속되어있음 => 섹션을 확인하고 맞춰서 크기 지정필요
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        
        switch section{
        case 0: // 프로필 화면을 보여주기 위한 셀에 대한 크기 지정
            return CGSize(
                width: collectionView.frame.width,
                height: CGFloat(159)
            )
        default: // 피드 셀에 대한 크기 지정 => 한 화면에 3개씩 들어가도록 하는것이 목표라면 3으로 나눠줘야함
            //한 화면의 크기 확보
            //collectionview의 가로의 3분의 1씩 가져간다면 가운데 부분에 여백이 2개 생길것 => 여백을 1씩 둘 예정이므로(아래 함수 참고) 미리 -2를 해둔다.
            
            //수정 -2 => -4/3 : 한 가로에 아이템이 3개씩 들어가는 것이 우리의 목표
            //3개가 들어가면 여백은 총 4개가 발생함(*ㅁ*ㅁ*ㅁ*) 따라서 전체적으로 4를 빼줘야함
            //한 셀에 대해 여백이 총 6번 제거되므로(왼쪽,오른쪽에 대해 여백이 지정됨)
            //총 4의 여백을 지정해주기 위해선 4/3을 빼줘야함
            //(가로에 들어가는 것의 개수는 3개, 한 셀당 빼기 연산을 한번씩 수행, 같은 연산 3번 수행했을때 총 4가 빠지려면? => 4/3을 빼줘야함 4/3*3=4 이므로)
            let side = CGFloat((collectionView.frame.width/3)-4/3)
            return CGSize(
                width: side, height: side //정사각형으로 지정
            )
        }
    }
    
    //아이템 사이의 행(가로 사이의 여백) 간격 지정
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0: //프로필 아이템 간격은 0으로 둠
            return CGFloat(0)
        default: //위에서 말했듯이 피드 아이템간의 가로 간격을 1로 둠
            return CGFloat(1) //왼쪽, 오른쪽 각각 여백이 지정됨
        }
    }
    
    //아이템 사이의 열(세로 사이의 여백) 간격 지정
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        default: //피드 아이템간의 높이 간격 지정
            return CGFloat(1)
        }
    }
}
