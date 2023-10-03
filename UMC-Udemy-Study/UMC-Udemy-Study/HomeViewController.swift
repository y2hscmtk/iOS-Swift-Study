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
        
        //스토리 nib파일의 존재를 뷰에게 알린다.
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
        
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
        
        
        //0번째 칸은 별도의 셀을 보여줄 것임 => 스토리를 보여주기 위한 셀
        if indexPath.row == 0 {
            //스토리를 보여주기 위한 셀
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else{
                return UITableViewCell()
            }
            return cell
        } else {
            //내가 작성한 셀을 identifier를 통해 불러와서 FeedTableViewCell타입으로 다운캐스팅, 만약 그러한 셀이 없다면(guard문) 일반 UITableViewCell을 만들어서 리턴하라
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else{
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none//셀 클릭할수 없도록 변경
            return cell //guard문 통과시, cell리턴
        }
    }
    
    //생성될 셀의 높이 600으로 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //스토리를 보여주기 위한 0번째 셀의 경우에는 높이를 80으로 설정
        if indexPath.row == 0{
            return 80
        }
        return 600
    }
    
    
    //셀이 보여질 때 호출되는 함수
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //StoryTableViewCell은 테이블 뷰 내부에서, 스토리 컬렉션 뷰를 보여주기 위한 Cell에 해당
        //셀이 보여질때, StoryTableViewCell타입으로 다운캐스팅하여 불러온 후, delegate를 해주기 위함
        guard let tableViewCell = cell as? StoryTableViewCell else {
            return
        }
        //tableView.delegate = self에 해당함
        //tableView 내부의 CollectionView에서 delegate를 HomeViewController로 설정하는 것이 불가능하기 때문에
        //셀이 생성되기 전에 사전에 작성해둔 StoryTableViewCell의 setCollection..함수를 호출하는 것임 => 이를 통해 컬렉션뷰의 delegate를 self(HomeViewController로 지정이 가능함)
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

//컬렉션뷰의 기능을 사용하기 위해, 컬렉션뷰 프로토콜을 확장
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //몇개의 셀을 보여줄 것인지 => 컬렉션뷰에서
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 //10개를 보여주겠다.
    }
    
    //어떤 셀을 보여줄 것인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //컬렉션 뷰에서 사용할 셀 가져오기 => StoryCollectionViewCell 라는 식별자를 통해 컬렉션뷰의 셀을 가져온다.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    
    //컬렉션뷰는 반드시 높이와 너비를 설정해야함
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60) //50x60으로 크기 지정
    }
    
}
