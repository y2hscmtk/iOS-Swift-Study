//
//  PriceCollectionViewCell.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/27.
//

import UIKit

class PriceCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PriceCollectionViewCell"

    @IBOutlet weak var tableview: UITableView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setTableView()
    }
    
    
    func setTableView(){
        tableview.dataSource = self
        tableview.delegate = self
        
        tableview.register(UINib(nibName: "PriceTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: PriceTableViewCell.identifier)
    }
    
    
}

extension PriceCollectionViewCell : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: PriceTableViewCell.identifier, for: indexPath) as? PriceTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    
    
}
