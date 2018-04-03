# MagicAdvertCell
类似知乎、汽车之家广告页

* 主要实现原理：在cell中添加一个scrollView，并且在scrollView中添加一个imageView，当滑动tableView的时候动态改变cell中的scrollView的偏移量。
* 实现代码:

   `func scrollViewDidScroll(_ scrollView: UIScrollView) {`
   
        let tableView = scrollView as! UITableView
        
        let array = tableView.visibleCells
        
        for obj in array {
            
            //第一种方法，cell中添加scrollView（计算神马的比较麻烦）
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
                
            }else if obj.isKind(of: SecondTableViewCell.self) {
                
                //第二中方法，获取cell距离屏幕顶部的距离，传递给cell动态改变imgView的origin.y（比较简单）
                let cell = obj as! SecondTableViewCell
                
                let rect = cell.superview?.convert(cell.frame, to: self.view)
                
                cell.y = (rect?.origin.y)!
            }
        }
    }
    
* 实现效果:![image](https://github.com/huhaosanxiong/MagicAdvertCell/raw/master/MagicCell/ScreenShot/RecordVideo)
