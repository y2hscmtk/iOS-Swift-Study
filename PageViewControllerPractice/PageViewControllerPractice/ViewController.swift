//
//  ViewController.swift
//  PageViewControllerPractice
//
//  Created by Choi76 on 2023/12/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // pageviewController화면으로 이동
    @IBAction func showPageView(_ sender: Any) {
        let stoaryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 이동할 화면 찾기
        let pageVC = stoaryboard.instantiateViewController(identifier: "MyPageViewController")
        
        // 화면 이동
        self.navigationController?.pushViewController(pageVC, animated: true)
    }
    
}

