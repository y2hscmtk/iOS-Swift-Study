//
//  HomeViewController.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/03.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! //기초가 될 전체 테이블 뷰
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 테이블 뷰에 대한 위임자 설정
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}


//확장을 유용하게 하도록 하기 위해 extention으로 정의
//UITableView 클래스의 기능(Protocol)을 HomViewController가 수행하도록(Delegate)할 것이다.
//tableView.delegate = self
//어떤 기능을 수행하도록 할것인지 기능에 대한 동작을 서술해야함
extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    
    //몇개의 셀을 보여줄 것인지 결정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //어떤 셀을 보여줄 것인지 결정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() //셀 생성 => 화면에 보여줄 테이블 뷰의 셀
        cell.backgroundColor = UIColor(named: "disableButtonColor") //눈에 잘 띄도록 파란색으로 설정
        return cell
    }
    
}
