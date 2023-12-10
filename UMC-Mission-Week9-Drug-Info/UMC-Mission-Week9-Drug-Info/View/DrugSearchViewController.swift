//
//  DrugSearchViewController.swift
//  UMC-Mission-Week9-Drug-Info
//
//  Created by Choi76 on 2023/12/08.
//

import UIKit
import Kingfisher // 이미지 삽입용(링크)

// 알약을 검색하는 페이지
// 검색 결과를 테이블 뷰를 사용하여 보여준다.
class DrugSearchViewController: UIViewController {
    // 사용자가 검색한 내용
    @IBOutlet weak var searchTextFiled: UITextField!
    // 검색하기 버튼
    @IBOutlet weak var searchBtn: UIButton!
    // 검색결과를 보여주기 위한 테이블 뷰
    @IBOutlet weak var searchResultTableView: UITableView!
    
    // 검색 결과 알약 데이터
    var searchResult : [DrugItem] = []// 검색하기전에는 빈 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 디자인 설정
        searchBtn.layer.cornerRadius = 10
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 네비게이션 바 숨기기
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 다른 뷰로 이동할 때 네비게이션 바를 다시 보이게 설정
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // 검색 버튼 눌렀을때 로직
    @IBAction func serachBtnDidTapped(_ sender: Any) {
        // 검색필드가 비어있는지 아닌지 검사
        if(searchTextFiled.text != ""){
            // 비어있지 않다면 API로부터 데이터 요청
            let parameter = APIParameter(efcyQesitm: searchTextFiled.text!)
            print("paramete : \(parameter)")
            DrugAPI.shared.searchDrug(parameter,self)
            //DrugAPI.shared.searchDrugTest(parameter)
        } else {
            print("내용이 비었습니다.")
        }
    }
    
    // 테이블뷰 init
    private func setTableView(){
        searchResultTableView.dataSource = self
        searchResultTableView.delegate = self
        
        // nib 등록
        searchResultTableView.register(UINib(nibName: "DrugTableViewCell", bundle: nil), forCellReuseIdentifier: DrugTableViewCell.identifier)
    }
    
}

// DrugAPI에서 데이터를 전달 받기 위함
extension DrugSearchViewController {
    func setSearchResultArray(searchResult : [DrugItem]){
        print("setSearchResultArray Call")
        self.searchResult = searchResult
        searchResultTableView.reloadData()
    }
}



// 테이블 뷰를 사용하기 위해 프로토콜 채택
extension DrugSearchViewController : UITableViewDelegate,UITableViewDataSource{
    // 몇개의 데이터를 보여줄 것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count // 검색 결과의 개수만큼
    }
    
    // 어떤 셀을 사용할 것인지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrugTableViewCell.identifier, for: indexPath) as? DrugTableViewCell else {
            let errorCell = UITableViewCell()
            errorCell.backgroundColor = .blue
            return errorCell
        }
        // 셀을 찾는데 성공하였다면
        let drug = searchResult[indexPath.row]
        // 셀에 필요한 데이터 주입
        cell.drugName.text = drug.itemName // 이름
        cell.company.text = drug.entpName // 제조사 이름
        // 이미지 설정하는 로직 작성
        
        // 셀 선택 효과 없애기(회색배경)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell // 셀 리턴
    }
    
    // 셀 클릭시 동작 정의
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stoaryboard = UIStoryboard(name: "Main", bundle: nil)
        // 이동할 화면 찾기
        let drugInfoView = stoaryboard.instantiateViewController(withIdentifier: "DrugInfoViewController") as! DrugInfoViewController
        let drug = searchResult[indexPath.row]
        // drugInfoView에 데이터 전달
        drugInfoView.drug = drug
        
        // 화면 이동
        self.navigationController?.pushViewController(drugInfoView, animated: true)
    }
    
}

