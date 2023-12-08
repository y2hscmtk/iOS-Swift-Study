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

    // 알약 이미지(없을수도 있음)
    @IBOutlet weak var drugImage: UIImageView!
    // 제조사
    @IBOutlet weak var company: UILabel!
    // 알약 이름
    @IBOutlet weak var drugName: UILabel!
    // 복용 효능(요약)
    // 복용 방법
    // 보관 방법
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
