//
//  StoryCollectionViewCell.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/03.
//

import UIKit

//스토리에 해당하는 컬렉션 뷰
//컬렉션 뷰의 레이아웃의 경우에는 백그라운드 뷰가 없기때문에 flowlayout을 프로토콜로 채택하는것임
//따라서 직접 뷰를 통해서 백그라운드를 만들어줘야함
class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewImageViewBackground: UIView!
    
    @IBOutlet weak var viewUserProfileBackground: UIView!
    
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewImageViewBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
    }

}
