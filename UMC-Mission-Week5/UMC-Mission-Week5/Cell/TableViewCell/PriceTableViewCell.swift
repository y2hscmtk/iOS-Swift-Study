//
//  PriceTableViewCell.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/27.
//

import UIKit

class PriceTableViewCell: UITableViewCell {
    
    static let identifier = "PriceTableViewCell"
    
    @IBOutlet weak var checkedImageView: UIImageView!
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    //동그라미 체크 표시
    let circleCheckedImage = UIImage(named: "checked")
    let circleUnCheckedImage = UIImage(named: "unChecked")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //체크 상태로 이미지 변경
    func changeCheckedState(){
        checkedImageView.image = circleCheckedImage
    }
    
    //체크 안한 상태로 이미지 변경
    func changeUnCheckedState(){
        checkedImageView.image = circleUnCheckedImage
    }

    
}
