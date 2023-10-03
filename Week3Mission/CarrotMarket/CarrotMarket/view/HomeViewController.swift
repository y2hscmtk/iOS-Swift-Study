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
        
        //보여줄 셀의 Nib정보를 tableview에 등록(레이아웃 등록?)
        let objectCell = UINib(nibName: "ObjectTableViewCell", bundle: nil)
        tableView.register(objectCell, forCellReuseIdentifier: "ObjectTableViewCell")
        
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
//        let cell = UITableViewCell()
//        cell.backgroundColor = .blue
//        return cell
        //식별자로 보여줄 셀 찾기
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectTableViewCell", for: indexPath) as? ObjectTableViewCell else{
            return UITableViewCell() //해당하는 셀이 없는 경우 일반 테이블 뷰 리턴
        }
        
        return cell //식별자에 해당하는 셀을 찾았을 경우 해당 셀 리턴
    }
}
