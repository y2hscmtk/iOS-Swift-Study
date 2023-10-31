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
    
    var maxSelectedCount : Int = 0 //사용자가 선택 가능한 최대 횟수
    
    var selectedCount = 0 //사용자가 현재 몇개 선택하였는지 카운팅
    
    
    var mainViewControllerReference: MainViewController? //Main에 대한 참조
    
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
        cell.selectPrice.text = formatCurrency(item.itemPrice)
        
        return cell
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
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath.row : \(indexPath.row)")
        //print("currList.selectedState : \(currList?.selectList[indexPath.row])")
        
        // 아이템을 직접 참조
        let cell = tableView.cellForRow(at: indexPath) as? OtherTableViewCell
        
        
        //참조가 없다면 종료
        guard let mainVC = mainViewControllerReference else {
            print("MainViewController not found")
            return
        }
        
        if self.itemList[indexPath.row].checkedState {
            // 체크 상태였다면 체크를 해제
            self.itemList[indexPath.row].checkedState = false
            // 그만큼 가격을 줄여야함
            mainVC.changeFoodCost(price: -itemList[indexPath.row].itemPrice)
            //MainViewController.foodCost -= itemList[indexPath.row].itemPrice
            
            cell?.changeUnCheckedState()
            print("checked -> unchecked")
            selectedCount -= 1 // 선택 횟수 -1
        } else {
            // 체크되지 않은 상태였다면 체크, 단 maxCount를 초과하는지 계산하여 넘지 않는경우에만 체크할수있도록
            selectedCount += 1 //사용자 체크 수 증가
            if selectedCount <= maxSelectedCount{
                self.itemList[indexPath.row].checkedState = true
                cell?.changeCheckedState()
                mainVC.changeFoodCost(price: itemList[indexPath.row].itemPrice)
                print("unchecked -> checked")
            } else { //선택 가능한 수를 초과했다면
                print("최대 \(maxSelectedCount)개만 선택 가능합니다.")
                selectedCount -= 1
            }
            
        }
    }
}
    

