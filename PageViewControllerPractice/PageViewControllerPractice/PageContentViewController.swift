//
//  PageContentViewController.swift
//  PageViewControllerPractice
//
//  Created by Choi76 on 2023/12/13.
//

import UIKit


// 재활용 될 뷰에 해당
// 해당 VC를 재활용하여, 사용자에게 화면을 보여준다.
class PageContentViewController: UIViewController {
    
    var pageIndex: Int = 0 // 현재 페이지의 식별자?
    var pageText: String = ""
    
    // 페이지 식별 용
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setVale() // 값 할당
    }
    
    private func setVale(){
        contentLabel.text = pageText // 값 할당
    }

}
