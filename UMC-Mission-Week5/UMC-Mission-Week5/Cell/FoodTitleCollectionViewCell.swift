//
//  FoodTitleCollectionViewCell.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/27.
//

import UIKit

//컬렉션 뷰의 0번째 셀에 붙이기 위한 음식 설명을 위한 셀
//음식 사진, 음식 이름, 음식 설명
class FoodTitleCollectionViewCell: UICollectionViewCell {

    //MARK: Properties
    
    static let identifier = "FoodTitleCollectionViewCell"
    
    @IBOutlet weak var foodImage: UIImageView! //음식 이미지
    
    @IBOutlet weak var foodTitle: UILabel! //음식 이름
    
    @IBOutlet weak var foodExplain: UILabel! //음식 설명
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
