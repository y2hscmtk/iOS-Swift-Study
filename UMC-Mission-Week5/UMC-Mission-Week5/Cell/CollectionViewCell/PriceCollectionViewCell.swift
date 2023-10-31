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
    
    var mainViewControllerReference : MainViewController?
    
    var maxSelectedCount : Int = 1 //사용자가 선택 가능한 최대 횟수
    
    var selectedCount = 0 //사용자가 현재 몇개 선택하였는지 카운팅

    
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
    
    
    // 000 3개씩 분리하여 가격 표시
    func formatCurrency(_ value: Int) -> String {
        // NumberFormatter를 사용하여 숫자를 통화 형태로 변환
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal // 세 자리마다 쉼표를 추가
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        
        if let formattedNumber = formatter.string(from: NSNumber(value: value)) {
            return "+\(formattedNumber)원"
        } else {
            return "+\(value)원"
        }
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
        cell.priceLabel.text = formatCurrency(item.itemPrice)
        print("cell state : \(item.checkedState)")
        if item.checkedState == true{
            cell.changeCheckedState()
        } else {
            cell.changeUnCheckedState()
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("PriceCollectionViewCell Clicked : \(indexPath.row)")
        //선택 된 셀에 대해서

        
        // 아이템을 직접 참조
        let cell = tableView.cellForRow(at: indexPath) as? PriceTableViewCell
        
        
        //참조가 없다면 종료
        guard let mainVC = mainViewControllerReference else {
            print("MainViewController not found")
            return
        }
        
        
        if self.menuList[indexPath.row].checkedState {
            // 체크 상태였다면 체크를 해제
            self.menuList[indexPath.row].checkedState = false
            // 그만큼 가격을 줄여야함
            mainVC.changeFoodCost(price: -menuList[indexPath.row].itemPrice)
            //MainViewController.foodCost -= itemList[indexPath.row].itemPrice
            
            cell?.changeUnCheckedState()
            print("checked -> unchecked")
            selectedCount -= 1 // 선택 횟수 -1
            MainViewController.selectedSize = self.menuList[indexPath.row].itemTitle
        } else {
            // 체크되지 않은 상태였다면 체크, 단 maxCount를 초과하는지 계산하여 넘지 않는경우에만 체크할수있도록
            selectedCount += 1 //사용자 체크 수 증가
            if selectedCount < maxSelectedCount{
                self.menuList[indexPath.row].checkedState = true
                cell?.changeCheckedState()
                mainVC.changeFoodCost(price: menuList[indexPath.row].itemPrice)
                print("unchecked -> checked")
                MainViewController.selectedSize = self.menuList[indexPath.row].itemTitle
            } else { //선택 가능한 수를 초과했다면
                print("최대 \(maxSelectedCount)개만 선택 가능합니다.")
                selectedCount -= 1
            }
            
        }
    }
    
}
