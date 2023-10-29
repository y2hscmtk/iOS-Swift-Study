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
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
