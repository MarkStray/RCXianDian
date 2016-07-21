//
//  XDBaseTabBarController.swift
//  RCXianDian
//
//  Created by user on 16/7/16.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class XDBaseTabBarController: UITabBarController {
    
    //var navItemList: [XDBaseNavigationController] = [];
    var navItemList: [XDBaseNavigationController] = [XDBaseNavigationController]()
    
    var tabBarModelList: [XDTabBarModel] = ParsePlistUtil.getTabBarModelList()

    var baseTabBar: XDTabBar?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildViewControllers()
    }
    
    private func setupChildViewControllers() {
        
        for tabBarModel in  tabBarModelList {
            
            //print("\(tabBarModel.className)")
            
            //动态获取命名空间：
            let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
            
            //根据命名空间和传过来的控制器名字获取控制器的类
            let className: AnyClass? = NSClassFromString(nameSpace + "." + tabBarModel.className!)
            
            //告诉编译器真实的控制器类型 是/或者父类是 XDBaseViewController
            let classNameType: XDBaseViewController.Type? = className as? XDBaseViewController.Type
            
            if let type = classNameType {
                
                //实例化控制器
                let rootVC: XDBaseViewController = type.init()
                rootVC.navigationItem.title = tabBarModel.title
                
                let baseNav: XDBaseNavigationController = XDBaseNavigationController(rootViewController:rootVC)
                
                navItemList.append(baseNav)
                
                addChildViewController(baseNav)
            } else {
                
                fatalError("unexpectedly found nil while unwrapping an Optional value")
            }

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


/**
 *  自定义 tabbar
 */

//private 只有当前文件可以访问

private let base_tag = 1001
private let right_retain = 80;

// iamge size 35*35 
// title size width*14

class XDTabBar: UIView {
    
    var tabBarModelList: [XDTabBarModel]?
    
    
    
    override init(frame: CGRect) {
        
        let itemCount = tabBarModelList!.count
        
        let itemWidth: CGFloat = (SCREEN_WIDTH-80.0)/CGFloat(itemCount)

        for i in 0 ..< itemCount {
            
            //view
            let view: UIView = UIView(frame: CGRect(x: itemWidth*CGFloat(i), y: 0, width: itemWidth, height: frame.height))
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectedItemChange)))
            self.addSubview(view)
            
            //imageView
            let imageView: UIImageView = UIImageView(frame: CGRect(origin: CGPoint(x: view.centerX, y: 0), size: CGSize(width: 35.0, height: 35.0)))
            imageView.image = UIImage(CGImage: tabBarModelList![i].image!)
            
            if i == 0 {
                imageView.image = UIImage(CGImage: tabBarModelList![i].imageSelected!)
            }
            view.addSubview(imageView)
            
            //label
            let label: UILabel = UILabel()
            
        }
        
    }
    
    
    
    func selectedItemChange() {
        
    }
}









