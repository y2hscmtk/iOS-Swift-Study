//
//  OtherCollectionViewCell.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/27.
//

import UIKit

class OtherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var selectTitleLabel: UILabel!
    @IBOutlet weak var maxSelectLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    static let identifier = "OtherCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setTableView()
    }
    
    func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        //셀 등록
        tableView.register(UINib(nibName: "OtherTableViewCell", bundle: nil), forCellReuseIdentifier: OtherTableViewCell.identifier)
    }

}

extension OtherCollectionViewCell : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OtherTableViewCell.identifier, for: indexPath) as? OtherTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
    
}
