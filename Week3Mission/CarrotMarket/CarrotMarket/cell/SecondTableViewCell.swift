//
//  SecondTableViewCell.swift
//  CarrotMarket
//
//  Created by Choi76 on 2023/10/10.
//

import UIKit


//두번째 테이블 뷰에 대한 셀
class SecondTableViewCell: UITableViewCell {

    
    @IBOutlet weak var objectTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
