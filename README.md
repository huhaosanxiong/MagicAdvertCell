# MagicAdvertCell
类似知乎、汽车之家广告页

* 主要实现原理：在cell中添加一个scrollView，并且在scrollView中添加一个imageView，当滑动tableView的时候动态改变cell中的scrollView的偏移量。
* 实现代码:

   `func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
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
    }`
    
* 实现效果:![image](https://github.com/huhaosanxiong/MagicAdvertCell/raw/master/MagicCell/ScreenShot/IMG_0485.TRIM.MOV)
