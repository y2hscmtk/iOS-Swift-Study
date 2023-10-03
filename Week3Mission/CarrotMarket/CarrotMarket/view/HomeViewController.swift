//
//  HomeViewController.swift
//  CarrotMarket
//
//  Created by Choi76 on 2023/10/03.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //테이블 뷰의 위임자로, HomeViewController선정
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

//테이블 뷰 기능 확장
extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    //총 몇개의 셀을 보여줄 것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //테스트용으로 10개
    }
    
    
    //보여줄 셀은 어떤 것인지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .blue
        return cell
        
    }
    
    
}
