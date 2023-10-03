//
//  FeedTableViewCell.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/03.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewFiled: UIImageView!
    @IBOutlet weak var buttonIsBookMark: UIButton!
    @IBOutlet weak var labelHowManyLike: UILabel!
    @IBOutlet weak var labelFeed: UILabel!
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    @IBOutlet weak var buttonIsHeart: UIButton!
    
    @IBAction func actionIsHeart(_ sender: Any) {
        if buttonIsHeart.isSelected{
            buttonIsHeart.isSelected = false //다시 선택 가능하도록?
        }else{
            buttonIsHeart.isSelected = true
        }
    }
    
    @IBAction func actionIsBookMark(_ sender: Any) {
        if buttonIsBookMark.isSelected{
            buttonIsBookMark.isSelected = false //다시 선택 가능하도록?
        }else{
            buttonIsBookMark.isSelected = true
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //nib이 최초 생성될때 호출?
        profileImage.layer.cornerRadius = 12.5
        profileImage.clipsToBounds = true
        imageViewMyProfile.layer.cornerRadius = 12.5
        imageViewMyProfile.clipsToBounds = true
        
        
        //닉네임 부분만 글씨 굵게 만들기
        let fontsize = UIFont.boldSystemFont (ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        attributedStr.addAttribute(.font, value: fontsize, range: NSRange.init (location: 0, length: 3))
        labelFeed.attributedText = attributedStr //지정한 스트링 속성 적용?
        
        
    }

    @IBAction func buttonIsHeart(_ sender: Any) {
    }
    
    //테이블을 클릭했을 때에 대한 동작
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
