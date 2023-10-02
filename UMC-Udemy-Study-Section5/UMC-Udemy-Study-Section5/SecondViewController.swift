//
//  SecondViewController.swift
//  UMC-Udemy-Study-Section5
//
//  Created by Choi76 on 2023/10/02.
//

import UIKit

//SecondViewContoller에서는 MainViewController에서 작성한 프로토콜(ChangeLabelDelegate)의 기능을 위임(Delegate)받아서 값을 변경할수 있도록 해야함

class SecondViewController: UIViewController,ChangeLabelDelegate {
    //ChangeLabelDelegate의 기능 정의 => viewDidLoad에서 위임받은 사실을 알려줘야함
    func doChange() {
        //dataTextField의 텍스트 값으로 MainView의 라벨의 텍스트를 변경
        previousViewController?.mainLabel.text = self.dataTextField.text
    }
    
    //MARK: dataTextField
    @IBOutlet weak var dataTextField: UITextField!
    
    //이전의 뷰가 어떤 뷰였는지 알아야함 => 앞서 작성한 프로토콜을 사용하여 데이터를 전달하기 위해
    var previousViewController : MainViewController? //이전 뷰 컨트롤러에 대한 참조 기록
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //위임 사실 전달
        previousViewController?.delegate = self //위임받겠다.
    }
    
    //돌아가기 버튼
    @IBAction func dismissButton(_ sender: Any) {
        //구현한 기능(doChange) 호출
        doChange()
        dismiss(animated: true) //되돌아가기
    }
}
