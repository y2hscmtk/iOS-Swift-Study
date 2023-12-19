//
//  ReelsCell.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/12/19.
//

import UIKit
import SnapKit
import AVKit

class ReelsCell : UICollectionViewCell{
    static let identifier = "ReelsCell"
    
    var videoView : VideoPlayerView?
    
    // 셀의 타이틀
    let cellTitleLabel = UILabel()
    
    // 카메라 이미지
    let cameraImageView = UIImageView()
    
    // 댓글
    let commentImageView = UIImageView()
    
    // 좋아요
    let likeImageView = UIImageView()
    
    // 공유하기
    let shareImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 동영상 url지정
    public func setupURL(_ urlStr: String){
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr)
        setupAttribute()
        setupLayout()
    }
    
    // 상태값 지정
    private func setupAttribute(){
        cellTitleLabel.text = "릴스"
        cellTitleLabel.font = .boldSystemFont(ofSize: 25)
        cellTitleLabel.textAlignment = .left // 왼쪽에서부터 글자 시작
        
        [cameraImageView,shareImageView,likeImageView,commentImageView].forEach{
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .white
        }
        // 카메라
        cameraImageView.image = UIImage(systemName: "camera") // 카메라 시스템 이미지
        // 공유하기 버튼
        shareImageView.image = UIImage(systemName: "paperplane")
        // 좋아요 버튼
        likeImageView.image = UIImage(systemName: "suit.heart")
        // 댓글 버튼
        commentImageView.image = UIImage(systemName: "message")
    }
    
    // 레이아웃 지정
    private func setupLayout(){
        guard let videoView = videoView else {return}
        contentView.addSubview(videoView)
        
        // SnapKit을 사용하여 레이아웃 지정 make => videoView
        // 앵커를 사용할때보다 훨씬 간단하게 레이아웃처리가 가능하다.
        videoView.snp.makeConstraints{ make in
            // videoView의 상하좌우 모든 방향(edges)에 대해 현재 뷰의 컨텐트뷰에 크기를 맞춘다
            make.edges.equalToSuperview()
        }
        
        // 각각의 뷰의 위치들을 추상화하여 배열로 작성
        // 타이틀 왼쪽 상단, 카메라 오른쪽 상단
        // 좋아요 버튼,댓글버튼,공유버튼 오른쪽 하단
        [cellTitleLabel, cameraImageView,
        likeImageView,
        commentImageView,
        shareImageView]
            .forEach{ contentView.addSubview($0) }
        
        // 타이틀 레이아웃 설정
        cellTitleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20) // 위에서 20만큼
            make.leading.equalToSuperview().offset(20) //왼쪽에서 20만큼 떨어지게 설정
        }
        
        // 카메라 이미지 레이아웃 설정
        cameraImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20) // 안쪽으로 집어넣기
            make.width.height.equalTo(35) // 크기 지정
        }
        
        let space = CGFloat(20) // 간격
        
        // 공유하기 버튼 => 오른쪽 하단
        shareImageView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-50)
            make.trailing.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(35) // 크기 지정
        }
        
        // 댓글 => 공유하기버튼의 위치에 맞추기
        commentImageView.snp.makeConstraints{ make in
            make.bottom.equalTo(shareImageView.snp.top).offset(-space)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(35)
        }
        
        // 좋아요버튼 위치
        likeImageView.snp.makeConstraints{ make in
            make.bottom.equalTo(commentImageView.snp.top).offset(-space)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(35)
        }
        
    }
}

