//
//  MainViewController.swift
//  UMC-Mission-Week7
//
//  Created by Choi76 on 2023/11/14.
//

import UIKit

import KakaoSDKCommon
import KakaoSDKUser
import KakaoSDKAuth

import Kingfisher

class MyNoteViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView! //사용자 프로필 사진
    
    @IBOutlet weak var profileLabel: UILabel! //사용자 이름
    
    @IBOutlet var userEmailLabel: UIView! //사용자 이메일
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImageView.layer.cornerRadius = 25 //50x50이므로 25
        
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            } else if let userInfo = KaKaoReference.shared.extractUserInfo(user) {
                print("### Extracted User Info: \(userInfo)")
                self.profileLabel.text = userInfo["nickname"] as? String
                let urlString = userInfo["profileImage"]
                let url = URL(string: urlString as! String)
                self.profileImageView.kf.setImage(with:url)
            }
        }
    }

}
