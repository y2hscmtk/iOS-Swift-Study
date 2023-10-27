//
//  OtherCollectionViewCell.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/27.
//

import UIKit

class OtherCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OtherCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    
    func setTableView(){
        
    }
    
}

extension OtherCollectionViewCell : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
