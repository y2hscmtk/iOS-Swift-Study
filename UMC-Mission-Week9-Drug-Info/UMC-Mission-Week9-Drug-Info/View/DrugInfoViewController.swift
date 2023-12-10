//
//  DrugInfoViewController.swift
//  UMC-Mission-Week9-Drug-Info
//
//  Created by Choi76 on 2023/12/08.
//

import UIKit

// API를 통해 얻어온 알약 정보를 화면에 보여준다.
// 화면에 보여줄 데이터
class DrugInfoViewController: UIViewController {

    var drug : DrugItem? // 전달 받은 알약 데이터
    /*
     let itemImage : String // 알약 이미지 링크
     let itemName : String // 알약 이름
     let entpName : String // 알약 제조사
     let efcyQesitm : String // 알약 효능 요약
     let useMethodQesitm : String // 복용 방법
     let depositMethodQesitm : String // 보관 방법
    */
    
    // 알약 이미지(없을수도 있음)
    @IBOutlet weak var drugImage: UIImageView!
    // 제조사
    @IBOutlet weak var company: UILabel!
    // 알약 이름
    @IBOutlet weak var drugName: UILabel!
    // 복용 효능(요약)
    @IBOutlet weak var efficient: UILabel!
    // 복용 방법
    @IBOutlet weak var howToUse: UILabel!
    // 보관 방법
    @IBOutlet weak var howToStore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setValue() // 값 삽입
    }
    
    // 데이터 삽입
    func setValue(){
        company.text = drug?.entpName ?? "회사 정보가 없습니다"
        drugName.text = drug?.itemName
        efficient.text = drug?.efcyQesitm ?? "효능에 대한 정보가 없습니다."
        howToUse.text = drug?.useMethodQesitm ?? "복용 방법에 대한 정보가 없습니다."
        howToStore.text = drug?.depositMethodQesitm ?? "보관 방법에 대한 정보가 없습니다."
    }


}
