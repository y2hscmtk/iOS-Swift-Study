//
//  ViewController.swift
//  PageViewControllerPractice
//
//  Created by Choi76 on 2023/12/13.
//

import UIKit

class ViewController: UIViewController {
    
    // uiview를 MyPageViewController의 컨테이너로 사용
    @IBOutlet weak var containerView: UIView!
    
    // containerView에 할당할 MyPageViewController
    var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 스토리보드에서 MyPageViewController 인스턴스화
        if let pageVC = storyboard?.instantiateViewController(withIdentifier: "MyPageViewController") as? MyPageViewController {
            self.pageViewController = pageVC
            self.addChild(pageVC) // 자식 뷰 컨트롤러로 추가
            self.containerView.addSubview(pageVC.view) // containerView에 뷰 추가

            // MyPageViewController의 뷰 크기 및 위치 조정
            pageVC.view.frame = containerView.bounds
            pageVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            pageVC.didMove(toParent: self)
        }
    }

    
    
}

