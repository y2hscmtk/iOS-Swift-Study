//
//  VideoPlayerView.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/12/19.
//

import Foundation
import UIKit
import AVKit

class VideoPlayerView: UIView {
    var playerLayer : AVPlayerLayer? // 재생될때 레이어(크기) 잡아주기
    var playerLooper : AVPlayerLooper? // 반복재생
    var queuePlayer : AVQueuePlayer? // 먼저 들어온 영상을 먼저 재생
    var urlStr: String
    
    init(frame:CGRect,urlStr:String){
        self.urlStr = urlStr
        super.init(frame:frame) // 크기 지정
        
        // 동영상 url
        let videoFileURL = Bundle.main.url(forResource: urlStr, withExtension: "mp4")!
        let playItem = AVPlayerItem(url: videoFileURL) // AVPlayerItem 생성
        
        self.queuePlayer = AVQueuePlayer(playerItem: playItem)
        
        playerLayer = AVPlayerLayer()
        playerLayer!.player = queuePlayer
        playerLayer!.videoGravity = .resizeAspectFill
        
        self.layer.addSublayer(playerLayer!)
        
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playItem)
        queuePlayer!.play() // 영상 재생
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func cleanup(){
        queuePlayer?.pause() // 영상 중지
        // 메모리 비우기
        queuePlayer?.removeAllItems()
        queuePlayer = nil
    }
    
    // 레이아웃이 업데이트될때마다 호출
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer!.frame = bounds // 프레임을 바운드와 맞춰준다 => 흔들림 방지
    }
}
