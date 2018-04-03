//
//  SecondTableViewCell.swift
//  MagicCell
//
//  Created by 胡浩三雄 on 2018/4/3.
//  Copyright © 2018年 胡浩三雄. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    var imgView : UIImageView!
    var view : UIView!
    var speed : CGFloat = 0.7
    
    var y : CGFloat = 0.0{
        
        willSet {
            imgView.frame = CGRect.init(x: 0, y: -newValue*speed, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func cellWithTableView(tableView: UITableView) -> SecondTableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.cellID())
        if cell == nil {
            cell = SecondTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: SecondTableViewCell.cellID())
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        return cell as! SecondTableViewCell
    }
    
    class func cellID() -> String {
        return "SecondTableViewCell"
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 150))
        view.layer.masksToBounds = true
        self.contentView.addSubview(view)
        
        imgView = UIImageView.init()
        imgView.image = Asset.img0522.image
        view.addSubview(imgView)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
