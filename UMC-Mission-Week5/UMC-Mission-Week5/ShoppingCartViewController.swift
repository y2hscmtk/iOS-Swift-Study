//
//  ShoppingCartViewController.swift
//  UMC-Mission-Week5
//
//  Created by Choi76 on 2023/10/30.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    
    var selectedPrice : Int = 0 //전달받을 정수 값
    
    var selectedSize : String = "M" //사용자가 선택한 사이즈
    
    @IBOutlet weak var selectedPriceLabel: UILabel!
    
    @IBOutlet weak var selectedPizzaSizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let finalPrice = formatCurrency(selectedPrice)
        priceLabel.text = finalPrice
        selectedPriceLabel.text = "* 가격 : \(finalPrice)"
        selectedPizzaSizeLabel.text = "* 피자사이즈선택 : \(selectedSize)"
    }
    
    
    // 000 3개씩 분리하여 가격 표시
    func formatCurrency(_ value: Int) -> String {
        // NumberFormatter를 사용하여 숫자를 통화 형태로 변환
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal // 세 자리마다 쉼표를 추가
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        
        if let formattedNumber = formatter.string(from: NSNumber(value: value)) {
            return "\(formattedNumber)원"
        } else {
            return "\(value)원"
        }
    }
    
    //뷰 컨트롤러가 다시 보이게 설정
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
