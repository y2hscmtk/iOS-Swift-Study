//
//  OtherTableViewCell.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/27.
//

import UIKit

class OtherTableViewCell: UITableViewCell {

    static let identifier = "OtherTableViewCell"
    
    @IBOutlet weak var checkedImage: UIImageView!
    
    @IBOutlet weak var selectTitle: UILabel!
    
    @IBOutlet weak var selectPrice: UILabel!
    
    
    //체크시 변경할 이미지 소스
    let squareUnCheckedIamge = UIImage(named: "squareUnChecked")
    let squareCheckedImage = UIImage(named: "squareChecked")

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //체크 상태로 이미지 변경
    func changeCheckedState(){
        checkedImage.image = squareCheckedImage
    }
    
    //체크 안한 상태로 이미지 변경
    func changeUnCheckedState(){
        checkedImage.image = squareUnCheckedIamge
    }

    
}
