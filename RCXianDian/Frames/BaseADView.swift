//
//  BaseADView.swift
//  RCXianDian
//
//  Created by timer_open on 16/7/25.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit
protocol BaseADViewdelegate:NSObjectProtocol {
    func BaseADViewClickIndex(index:NSInteger)
}
class BaseADView: UIView,UIScrollViewDelegate {
    var pagecontrol:UIPageControl = UIPageControl()
    var scrollview : UIScrollView = UIScrollView()
    var delegate:BaseADViewdelegate?
    //    是否自动滑动
    var ismotion:Bool = true
    var timer:NSTimer = NSTimer()
    var totlecount:NSInteger = NSInteger()
    
    func initViewWithImageUrls(Images:NSArray)  {
        self.scrollview.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        let image_W:CGFloat = self.frame.size.width
        let image_H:CGFloat = self.frame.size.height
        let image_Y:CGFloat = 0
        self.totlecount = Images.count
        for index in 0..<self.totlecount {
            let imageView :UIImageView = UIImageView()
            let image_X:CGFloat = CGFloat(index) * image_W
            imageView.frame = CGRectMake(image_X, image_Y, image_W, image_H)
            let url:NSString = Images[index] as! NSString
            imageView.sd_setImageWithURL(NSURL(string:url as String ), placeholderImage: nil)
            imageView.userInteractionEnabled = true
            imageView.tag = index + 1000
            let tapGR = UITapGestureRecognizer(target: self, action:
                #selector(tapHandler))
            
            imageView.addGestureRecognizer(tapGR)
            self.scrollview.showsHorizontalScrollIndicator = false
            self.scrollview.addSubview(imageView)
        }
        let page_W = self.frame.size.width/3
        let Pagebounds:CGRect = CGRectMake(self.center.x-page_W/2, image_H-44, page_W, 44)
        
        self.pagecontrol = UIPageControl(frame:Pagebounds )
        self.pagecontrol.numberOfPages = self.totlecount
        self.pagecontrol.addTarget(self, action: #selector(pageChangeValue), forControlEvents: .TouchUpInside)
        let content_W:CGFloat = image_W * CGFloat(self.totlecount)
        self.scrollview.contentSize = CGSizeMake(content_W, 0)
        self.scrollview.pagingEnabled = true
        self.scrollview.delegate = self
        self.addSubview(self.scrollview)
        self.addSubview(self.pagecontrol)
        if ismotion == true {
            self.addTimer()
        }else{
            return
        }

    }
//MARK:==================BaseADViewdelegate=======================
    func tapHandler(sender:UITapGestureRecognizer) {
        if ((self.delegate) != nil) {
          self.delegate?.BaseADViewClickIndex((sender.view?.tag)!-1000)
        }
    
        
        
    }
//MARK:==================PAGE点击触发方法================================
    func pageChangeValue() {
        
        self.scrollview.setContentOffset(CGPointMake((CGFloat)(self.pagecontrol.currentPage) * self.frame.size.width, 0), animated: true)
        
    }
//MARK:=======================代理方法================================
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollview_W:CGFloat = scrollView.frame.size.width
        let x:CGFloat = scrollView.contentOffset.x
        let page:Int = (Int)(x / scrollview_W)
        self.pagecontrol.currentPage = page
    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        if ismotion == true {
            self.removeTimer()
        }else{
            return
        }
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if ismotion == true {
            self.addTimer()
        }else{
            return
        }
    }
//MARK:=======================计时器方法================================
    func addTimer(){
        self.timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(nextImage), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.timer, forMode: NSRunLoopCommonModes)
    }
    func removeTimer(){
        self.timer.invalidate()
    }
    func nextImage(sender:AnyObject!){
        var page:Int = self.pagecontrol.currentPage
        if (page == self.totlecount-1) {
            page = 0
        }else{
            page += 1
        }
        let x:CGFloat = CGFloat(page) * self.frame.size.width
        self.scrollview.contentOffset = CGPointMake(x, 0)
    }
    
    
}
