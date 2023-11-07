//
//  ViewController.swift
//  UMC-Mission-Week6
//
//  Created by Choi76 on 2023/11/06.
//

import UIKit
import Alamofire


//UMC 6주차 과제 - 애니메이션 라이브러리 사용해보기
class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var catArray : [CatModel] = [] //서버로부터 전달받은 고양이 정보를 관리하기 위한 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTableView() // 테이블 뷰 세팅
        
        //서버로부터 정보 요청
        //limits는 전달받을 데이터의 총 개수, Page는 한번에 몇개씩 받아 올 것인지
        // params를 매개변수로 넣어서 API 요청하는 함수 호출,apiSuccess함수를 사용하기 위해 자기 자신의 참조를 전달
        let params = APIInput(limit: 10,page: 10)
        APIManager().getCatData(params,self)
    }

    
    func setTableView(){
        tableview.delegate = self
        tableview.dataSource = self
        
        //Nib파일 등록
        tableview.register(
            UINib(nibName: "CatTableViewCell", bundle: nil),
            forCellReuseIdentifier: CatTableViewCell.identifier)
    }
    
    func apiSuccess(_ catArray : [CatModel]){
        self.catArray = catArray //서버로부터 전달받은 고양이 정보 주입
        //테이블뷰 업데이트
        tableview.reloadData()
    }

}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    //몇개의 셀을 보여줄 것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catArray.count //얻어온 정보만큼
    }
    
    //어떤 셀을 보여줄 것인지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CatTableViewCell.identifier, for: indexPath) as? CatTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    
}

