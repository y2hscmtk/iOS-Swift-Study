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
    
    //현재 셀의 체크 상태
    var isChecked : Bool = false //디폴트는 체크 안된 상태
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    //셀 클릭시 동작처리 => 이미지 변경
    func didCellTapped(){
        print("OtherCell didCellTapped")
        if isChecked { //체크 된 상태에서 클릭시 => 체크 안된 상태로 변환
            checkedImage.image = squareUnCheckedIamge
            isChecked = false
        } else { // 체크 안된 상태에서 클릭시 => 체크 상태로 변환
            checkedImage.image = squareCheckedImage
            isChecked = true
        }
    }
    
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
    
}
