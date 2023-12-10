//
//  DrugTableViewCell.swift
//  UMC-Mission-Week9-Drug-Info
//
//  Created by Choi76 on 2023/12/08.
//

import UIKit

// 검색된 알약 미리보기 이미지
// 이미지와 알약의 이름, 제조사를 보여준다.
class DrugTableViewCell: UITableViewCell {
    
    static let identifier = "DrugTableViewCell"

    // 알약 이미지
    @IBOutlet weak var drugImage: UIImageView!
    // 알약 이름
    @IBOutlet weak var drugName: UILabel!
    // 알약 제조사
    @IBOutlet weak var company: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // drugImage.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
