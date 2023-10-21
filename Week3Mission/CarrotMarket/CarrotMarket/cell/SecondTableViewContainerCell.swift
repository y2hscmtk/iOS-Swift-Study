//
//  SecondTableViewContainerCell.swift
//  CarrotMarket
//
//  Created by Choi76 on 2023/10/10.
//

import UIKit

//두번째 테이블 뷰에 대한 컨테이너 역할을 하기 위한 셀
class SecondTableViewContainerCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView! //두번째 테이블 뷰를 보여주기 위한 컨테이너 역할을 수행하기 위한 테이블 뷰
    
    var objectTwoList : [ObjectTwoStruct] = []
    
    //테이블 뷰에서 위임을 처리하기 위한 함수
//    func setTableViewDataSourceDelegate(dataSourceDelegate : UITableViewDelegate & UITableViewDataSource, forRow row: Int, objectTwoList : [ObjectTwoStruct]){
//        self.objectTwoList = objectTwoList
//        tableView.delegate = dataSourceDelegate
//        tableView.dataSource = dataSourceDelegate
//        tableView.tag = row
//
//        //컬렉션뷰로 사용할 nib파일 등록
//        let secondTableViewNib = UINib(nibName: "SecondTableViewCell", bundle: nil)
//        tableView.register(secondTableViewNib, forCellReuseIdentifier: "SecondTableViewCell")
//
//        //등록이 완료됐을때, 다시한번 리로드
//        tableView.reloadData() //컬렉션뷰 새로고침
//
//    }
    
    func setObjectTwoList(objectTwoList : [ObjectTwoStruct]){
        self.objectTwoList = objectTwoList
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        
        let secondTableViewNib = UINib(nibName: "SecondTableViewCell", bundle: nil)
        tableView.register(secondTableViewNib, forCellReuseIdentifier: "SecondTableViewCell")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SecondTableViewContainerCell : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("SecondTableView numberOfRowsInSection called")
        return objectTwoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("SecondTableView cellForRowAt called")
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as? SecondTableViewCell else {
            return UITableViewCell()
        }
        //cell.objectImage.image = UIImage(named: objectTwoList[indexPath.row])
        
        //let image = UIImage(named: self.objectTwoList[indexPath.row].imageName)
        //cell.objectImage.image = image
        cell.objectTitle.text = self.objectTwoList[indexPath.row].objectTitle
        
        return cell
    }
}

