//
//  MainViewController.swift
//  UMC-Udemy-Study-Section5
//
//  Created by Choi76 on 2023/10/02.
//

import UIKit

//프로토콜 생성
//1. MainView는 doChange()기능을 수행하고 싶다. => 직접 수행하지 않고 대리자를 선정해서, 대리자가 수행하도록 하고 싶다.
protocol ChangeLabelDelegate:AnyObject {
    func doChange()
}


class MainViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel! //라벨에 대한 참조 받아오기
    
    //2. 대리로 수행하고 싶은 일은 ChangeLabelDelegate이다. => Strong Reference Cycle을 방지하기 위해 weak로 선언해야한다.
    weak var delegate : ChangeLabelDelegate? //위임에 대한 프로토콜 생성 => 아직 정의가 안된 기술 => SecondView에서 기술에 대한 정의?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Action
    @IBAction func changeViewButton(_ sender: Any) {
        let secondView = storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        secondView.modalPresentationStyle = .fullScreen //전체화면으로 보여주기
        //화면을 전환하기 앞서, 현재 뷰에 대한 참조 전달
        secondView.previousViewController = self
        //화면 전환
        self.present(secondView, animated: true)
    }
    
}
