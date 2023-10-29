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
    
    var itemList : [SelectModel] = []
    
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

    //선택 가능 메뉴 목록 리스트 값 할당
    public func setItem(itemList : [SelectModel]){
        self.itemList = itemList
    }
    
}

extension OtherCollectionViewCell : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return MainViewController.dowSelectList.count
        print("itemList Size : \(self.itemList.count)")
        return self.itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OtherTableViewCell.identifier, for: indexPath) as? OtherTableViewCell else {
            return UITableViewCell()
        }
        
        //정보 주입
        let item = self.itemList[indexPath.row]
        
        cell.selectTitle.text = item.itemTitle
        cell.selectPrice.text = String(item.itemPrice)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("OtherCollectionViewCell Clicked : \(indexPath.row)")
        MainViewController.foodCost += self.itemList[indexPath.row].itemPrice
        print("clicked food : \(MainViewController.foodCost)")
    }
    
    
}
