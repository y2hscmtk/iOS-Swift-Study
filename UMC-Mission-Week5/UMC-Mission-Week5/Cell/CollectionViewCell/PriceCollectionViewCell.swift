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
    
    var menuList : [SelectModel] = []
    
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
        return MainViewController.pizzaSizeSelectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: PriceTableViewCell.identifier, for: indexPath) as? PriceTableViewCell else{
            return UITableViewCell()
        }
        let item = menuList[indexPath.row]
        cell.sizeLabel.text = item.itemTitle
        cell.priceLabel.text = String(item.itemPrice)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("PriceCollectionViewCell Clicked : \(indexPath.row)")
    }
    
    
}
