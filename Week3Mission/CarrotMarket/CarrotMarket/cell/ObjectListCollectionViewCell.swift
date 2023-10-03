//
//  ObjectListCollectionViewCell.swift
//  CarrotMarket
//
//  Created by Choi76 on 2023/10/04.
//

import UIKit

class ObjectListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var objectImage: UIImageView!
    
    @IBOutlet weak var objectName: UILabel!
    
    @IBOutlet weak var objectPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        objectImage.layer.cornerRadius = 10
    }

}
