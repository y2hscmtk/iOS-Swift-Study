//
//  ProfileCollectionViewCell.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/21.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"

    //MARK: poperties
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var plusImageVIew: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var postingCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttributes()
    }

    
    //이미지뷰 둥글게 변경
    private func setupAttributes(){
        profileImageView.layer.cornerRadius = 88/2 //녹색 이미지뷰의 크기가 88이므로 2를 나눠주면 원이됨
        
        //shift + ctrl => 다중 커서
        //shift + option => 다중 커서 후 한번에 선택
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor //cgColor로 변환(버튼의 색은 라이트그레이로)
        profileImageView.layer.borderWidth = 1 //테두리 두께는 1로 지정
        
        
        
        //프로필 편집 버튼의 디자인 적용
        editButton.layer.cornerRadius = 5 //버튼의 모양은 둥글게
        editButton.layer.borderColor = UIColor.lightGray.cgColor //cgColor로 변환(버튼의 색은 라이트그레이로)
        editButton.layer.borderWidth = 1 //테두리 두께는 1로 지정
        
        //친구 추가 버튼 디자인 적용
        addFriendButton.layer.cornerRadius = 3 //버튼의 모양은 둥글게
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor //cgColor로 변환(버튼의 색은 라이트그레이로)
        addFriendButton.layer.borderWidth = 1 //테두리 두께는 1로 지정
        
        [postingCountLabel, followerCountLabel, followingCountLabel]
            .forEach{ $0?.text = "\(Int.random(in: 0...10))"}
    }
    
}
