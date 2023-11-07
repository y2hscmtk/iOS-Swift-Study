//
//  CatTableViewCell.swift
//  UMC-Mission-Week6
//
//  Created by Choi76 on 2023/11/07.
//

import UIKit

//고양이 정보를 기록하기 위한 셀
class CatTableViewCell: UITableViewCell {
    static let identifier = "CatTableViewCell"

    @IBOutlet weak var catID: UILabel! //고양이 아이디
    
    @IBOutlet weak var catImage: UIImageView! //고양이 이미지
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
