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
        //tableView.separatorStyle = .none //테이블 셀 간의 구분선 없애기
        
        //생성한 nib파일의 존재를 뷰에게 알려줘야함
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
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
    
    //어떤 셀을 보여줄 것인지 결정 => 여기서 어떤 셀을 선택할것인지 결정(셀이 여러개일수도 있으니까)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell() //셀 생성 => 화면에 보여줄 테이블 뷰의 셀
//        cell.backgroundColor = UIColor(named: "disableButtonColor") //눈에 잘 띄도록 파란색으로 설정
//        return cell
        
        //내가 작성한 셀을 identifier를 통해 불러와서 FeedTableViewCell타입으로 다운캐스팅, 만약 그러한 셀이 없다면(guard문) 일반 UITableViewCell을 만들어서 리턴하라
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else{
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none//셀 클릭할수 없도록 변경
        return cell //guard문 통과시, cell리턴
    }
    
    //생성될 셀의 높이 600으로 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
}
