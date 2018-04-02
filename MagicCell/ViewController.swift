//
//  ViewController.swift
//  MagicCell
//
//  Created by 胡浩三雄 on 2018/4/2.
//  Copyright © 2018年 胡浩三雄. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let magicHeight : CGFloat = 150.0
    
    //1.0是同步tableView的滑动速度
    let speed : CGFloat = 0.7
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row%10 == 9 {
            
            let cell = TableViewCell.cellWithTableView(tableView: tableView)
            
            return cell
            
        }else{
            
            let cellID = "cellID"
            
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                
                cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
            }
            cell?.textLabel?.text = "\(indexPath.row)"
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row%10 == 9 {
            return magicHeight
        }
        return 100.0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let tableView = scrollView as! UITableView
        
        let array = tableView.visibleCells
        
        for obj in array {
            
            if obj.isKind(of: TableViewCell.self) {
                
                let cell = obj as! TableViewCell
                
                //图片到底时cell中scrollview的偏移量
                let maxOffset = self.view.bounds.size.height - magicHeight
                
                //(cell.frame.origin.y - tableView.contentOffset.y) 为cell顶部到屏幕顶部的距离
                let scrollOffset = maxOffset - (cell.frame.origin.y - tableView.contentOffset.y)
                
                if maxOffset == scrollOffset {
                    
                    cell.scrollview.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
                    
                }else if scrollOffset == 0 {
                    
                    cell.scrollview.setContentOffset(CGPoint.init(x: 0, y: maxOffset), animated: false)
                    
                }else {
                    
                    cell.scrollview.setContentOffset(CGPoint.init(x: 0, y: (maxOffset - scrollOffset)*speed), animated: false)
                }
            }
        }
        
    }
}

