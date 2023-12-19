//
//  ReelsViewController.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/12/19.
//

import UIKit

class ReelsViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let videoURLStrArr = ["dummyVideo","dummyVideo2"]
    
    // 현재 어떤 페이지에 있는지 알아야함 => 스크롤을 위해
    private var nowPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setCollectionView()
    }
    
    func setCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 닙 등록
//        collectionView.register(UINib(nibName: "ReelsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ReelsCollectionViewCell.identifier)
        
        // SnapKit을 사용한 코드베이스 셀 등록 방법
        collectionView.register(
            ReelsCell.self,forCellWithReuseIdentifier:
                ReelsCell.identifier)
        
        // 스크롤이 빨리 되도록 처리
        collectionView.decelerationRate = .fast
        
        startLoop() //페이지 넘기기 수행
    }
    
    
    // 페이지 넘기기
    private func startLoop() {
        // 2초 간격으로 타임인터벌 호출
        let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true ) { _ in
            self.moveNextPage() // 다음 페이지로 이동하는 함수 호출
        }
    }
    
    private func moveNextPage(){
        let itemCount = collectionView.numberOfItems(inSection: 0) // 0번째 섹션에 몇개의 셀이 있는지 확인
        
        nowPage += 1
        if (nowPage >= itemCount){ //끝까지 다 돌았다면
            //처음페이지로 이동
            nowPage = 0
        }
        
        // 컬렉션뷰 스크롤해주기
        collectionView.scrollToItem(
            at: IndexPath(item: nowPage, section: 0),
            at: .centeredVertically,
            animated: true)
    }

}

extension ReelsViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCollectionViewCell.identifier, for: indexPath) as? ReelsCollectionViewCell else{
//            return UICollectionViewCell()
//        }
//        return cell
        
        // 코드기반 컬렉션뷰 셀 사용
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath)
                as? ReelsCell else {
            return UICollectionViewCell()
        }
        cell.setupURL(videoURLStrArr.randomElement()!)
        return cell
    }
    
    // 컬렉션 뷰 셀을 더이상 보여주지 않을때 호추됨
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell {
            cell.videoView?.cleanup() // 메모리 제거
        }
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
