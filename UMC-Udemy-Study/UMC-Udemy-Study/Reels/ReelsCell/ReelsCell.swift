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
    }
}

