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
    
    //현재 셀의 체크 상태
    var isChecked : Bool = false //디폴트는 체크 안된 상태
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //셀 클릭시 동작처리 => 이미지 변경
    func didCellTapped(){
        print("PriceCell didCellTapped")
        if isChecked { //체크 된 상태에서 클릭시 => 체크 안된 상태로 변환
            checkedImageView.image = circleUnCheckedImage
            isChecked = false
        } else { // 체크 안된 상태에서 클릭시 => 체크 상태로 변환
            checkedImageView.image = circleCheckedImage
            isChecked = true
        }
    }
    
}
