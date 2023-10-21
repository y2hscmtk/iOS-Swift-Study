//
//  ObjectTableViewCell.swift
//  CarrotMarket
//
//  Created by Choi76 on 2023/10/03.
//

import UIKit

class ObjectTableViewCell: UITableViewCell {

    @IBOutlet weak var labelObjectTitle: UILabel! //판매 제목
    @IBOutlet weak var labelObjectPrice: UILabel! //물건 가격
    @IBOutlet weak var labelObjectUploadDate: UILabel! //게시 날짜
    @IBOutlet weak var imageViewObjectImage: UIImageView! //물건 이미지
    
    @IBOutlet weak var labelHeartCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewObjectImage.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
