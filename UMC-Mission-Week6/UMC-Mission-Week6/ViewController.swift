//
//  ViewController.swift
//  UMC-Mission-Week6
//
//  Created by Choi76 on 2023/11/06.
//

import UIKit
import Alamofire
import Kingfisher // url to Image
import LoadingShimmer //Skeleton Animation
import ViewAnimator // view Animator
// ref : https://github.com/marcosgriselli/ViewAnimator

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
        //params를 매개변수로 넣어서 API 요청하는 함수 호출,apiSuccess함수를 사용하기 위해 자기 자신의 참조를 전달
        
        //요청 대기 시간 동안 LoadingShimmer를 활용하여 스캘래톤 이미지 보여주기
        
        //화면에 보여줄 스캘래톤 이미지 개수만큼, 식별자 배열에 삽입해줘야함
        //테이블 뷰는 셀을 재사용 해서 보여주기 떄문에, 하나의 테이블 뷰 셀에 대한 스캘래톤 이미만 적용되기때문
        let catTableViewCellIds = Array(repeating: CatTableViewCell.identifier, count: 10)

        
        LoadingShimmer.startCovering(tableview, with: catTableViewCellIds)
        
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
//        //테이블 뷰에 애니메이션 적용
//        let animation = AnimationType.from(direction: .right, offset: 300.0)
//        tableview.animate(animations: [animation],delay: 1.0,duration: 2.0) //1초(delay) 뒤에 2초(duration)에 걸쳐서애니메이션 효과
        
        LoadingShimmer.stopCovering(tableview) //로딩시머 종료
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
        
        //서버로부터 얻은 정보 주입
        //catArray의 정보 할당
        //얻어온 정보가 Optional이기 때문에, Optional을 해제시켜야함
        if let id = catArray[indexPath.row].id {
            cell.catID.text = String("ID : \(id)")
        }
        if let urlString = catArray[indexPath.row].url {
            let url = URL(string: urlString)
            cell.catImage.kf.setImage(with: url) //이미지 삽입
        }
        //셀마다 독립적으로 애니메이션 효과 부여
        //테이블 뷰에 애니메이션 적용
        let animation = AnimationType.from(direction: .right, offset: 300.0)
        //셀마다 시간을 달리하여 하나씩 왼쪽에서 보여지도록 효과 적용
        //duration에 걸쳐서 애니메이션을 보여주되,애니메이션 효과가 발생할 시간은 delay시간 이후
        cell.animate(animations: [animation],delay: 0.5 + Double(indexPath.row)*0.5,duration: 1.0)
        
        return cell
    }
    
    //테이블 뷰 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}

