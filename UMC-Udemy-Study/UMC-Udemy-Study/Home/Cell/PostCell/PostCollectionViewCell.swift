//
//  PostCollectionViewCell.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/22.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"

    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //이미지 변경
    public func setupData(){
        //이미지뷰의 이미지를 업로드한다.
    }

}
