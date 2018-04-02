//
//  TableViewCell.swift
//  MagicCell
//
//  Created by 胡浩三雄 on 2018/4/2.
//  Copyright © 2018年 胡浩三雄. All rights reserved.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {

    var scrollview : UIScrollView!
    var imgView : UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class func cellWithTableView(tableView: UITableView) -> TableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellID())
        if cell == nil {
            cell = TableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: TableViewCell.cellID())
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        return cell as! TableViewCell
    }
    
    class func cellID() -> String {
        return "TableViewCell"
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        scrollview = UIScrollView.init()
        scrollview.isUserInteractionEnabled = false
        scrollview.showsVerticalScrollIndicator = false
        self.contentView.addSubview(scrollview)
        
        imgView = UIImageView.init()
        imgView.image = Asset.img0016.image
        scrollview.addSubview(imgView)
        
        scrollview.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsets.zero)
        }
        imgView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollview).inset(UIEdgeInsets.zero)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
