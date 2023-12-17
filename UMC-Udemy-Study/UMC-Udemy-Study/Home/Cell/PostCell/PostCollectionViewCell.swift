//
//  PostCollectionViewCell.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/22.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"

    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //이미지 변경
    public func setupData(_ imageURLStr: String?){
        //이미지뷰의 이미지를 업로드한다.
        
        guard let imageURLStr = imageURLStr else { return }
        
        if let url = URL(string: imageURLStr){
            postImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
        
        
        
        //if let imageURL = URL(string: imageURLStr)
    }

}
