//
//  ProfileViewController.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/21.
//

import UIKit
import Kingfisher

// UIGestrueRecognizerDelegat => 오래 눌렀을때에 대한 이벤트를 사용하기 위한 프로토콜
class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 삭제할 인덱스 번호 => 함수에서 사용
    private var deletedIndex : Int?
    
    private var userPosts: [GetUserPosts]? { // 값 변경시 컬렉션뷰 새로고침
        didSet {self.collectionView.reloadData()} // didSet => 값 변경시 호출됨
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        
        //storyboard - collectionview - Section Inset을 1씩 둠으로써 왼쪽 끝과 오른쪽 끝에 여백을 줄 수 있음
        
        //서버연동 테스트
        UserFeedDataManager().getUserFeed(self)
        
    }
    
    // MARK: - Actions
    // 길게 눌러서 삭제하는 기능 추가
    // objc => object-c를 감싸고 있는 함수 구문?
    @objc
    func didLongPressCell(gestureRecognizer: UILongPressGestureRecognizer){ // UILongPressGestureRecognizer => 오래 눌렀을때를 인지하는 객체
        if gestureRecognizer.state != .began { return } // 방어 코드
        
        let position = gestureRecognizer.location(in: self.collectionView)
        
        // 해당하는 아이템 가져오기 => 위치를 통해 셀 정보에 접근
        if let indexPath = self.collectionView?.indexPathForItem(at: position){
            print("DEBUG : ",indexPath.item) //길게 누를경우 자기 자신에 대한 인덱스 번호 출력
            self.deletedIndex = indexPath.item // 삭제할 인덱스 번호 받아오기
            
            // PostIdx => userPosts배열에 존재
            guard let userPosts = self.userPosts else { return }
            let cellData = userPosts[indexPath.item]
            if let postIdx = cellData.postIdx{
                UserFeedDataManager().deleteUserFeed(self,postIdx) // 삭제 API 호출
                // 삭제 된 이후, 서버 데이터를 다시 받아오거나 - 로컬 데이터도 다시 삭제하는 로직 작성 필요
                
                // 로켈 데이터에서 삭제하는 방법 쳬택
            }
        }
        
    }
    
    
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
        
        // 길게 눌렀을때에 대한 제스처
        let gesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(didLongPressCell(gestureRecognizer: )))
        gesture.minimumPressDuration = 0.66
        gesture.delegate = self // UILongPressGestureDelegate => self
        gesture.delaysTouchesBegan = true
        self.collectionView.addGestureRecognizer(gesture) // 길게 눌렀을때에 대한 제스처 추가
        
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
        default: // 셀의 개수만큼 수정
            return userPosts?.count ?? 0 // 데이터가 없으면 0개
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
            
            let itemIndex = indexPath.item
            if let cellData = self.userPosts {
                let url = cellData[itemIndex].postImgUrl
                cell.setupData(url) // 데이터 전달
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


// MARK: - API 통신 메소드
extension ProfileViewController {
    func successFeedAPI(_ result: UserFeedModel){
        //self.userFeedData = result
        
        self.userPosts = result.result?.getUserPosts
    }
    
    // 삭제 API성공시 로컬에 남아있는 데이터도 삭제하는 로직 작성
    func successsDeletePostAPI(_ isSucess: Bool){
        guard isSucess else { return } // 성공했을때에만 삭제할 수 있도록
        
        // 해당하는 인덱스의 아이템 지우기
        if let deletedIndex = self.deletedIndex {
            self.userPosts?.remove(at: deletedIndex) // 로컬에서도 데이터 삭제
        }
        
    }
}

