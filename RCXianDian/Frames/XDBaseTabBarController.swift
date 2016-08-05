//
//  XDBaseTabBarController.swift
//  RCXianDian
//
//  Created by user on 16/7/16.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit


let tabBarModelList: [XDTabBarModel] = ParsePlistUtil.getTabBarModelList()


//MARK:- 定义协议 处理tabbar事件 协议

protocol XDTabBarAction {
    
    func selectedIndexChange(index: Int)
    
    func shoppingCarHandle()
}

//MARK:- 根标签控制器

class XDBaseTabBarController: UITabBarController {
    
    //var navItemList: [XDBaseNavigationController] = [];
    var navItemList: [XDBaseNavigationController] = [XDBaseNavigationController]()
    
    lazy var baseTabBar: XDTabBar = {
        let tabbarFrame = CGRect(x: 0, y: self.view.height-65.0, width: self.view.width, height: 65.0)
        let _tabbar: XDTabBar = XDTabBar.init(frame: tabbarFrame)
        _tabbar.tag = _TABBAR_TAG
        _tabbar.delegate = self
        return _tabbar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildViewControllers()
        
        setupTabBarView()
        setupNavAppearance()
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
    
    
    func setupTabBarView() {
        self.tabBar.hidden = true
        
        self.view.addSubview(baseTabBar)
    }

    
    func setupNavAppearance() {
        let navAppearance = UINavigationBar.appearance()
        navAppearance.barStyle = .Black
        navAppearance.barTintColor = GLOBAL_COLOR
        navAppearance.titleTextAttributes = [NSFontAttributeName : FONTSIZE_LARGE, NSForegroundColorAttributeName : UIColor.whiteColor()]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- 拓展来实现协议

extension XDBaseTabBarController: XDTabBarAction {
    
    func selectedIndexChange(index: Int) {
        selectedIndex = index
    }

    func shoppingCarHandle() {
        printLog(" handle ...")
    }
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////


//MARK:- 自定义 tabbar

//private 只有当前文件可以访问

private let baseView_tag = 1001
private let right_retain = CGFloat(80);

// iamge size 35*35 
// title size width*14

class XDTabBar: UIView {
    
    var imageViewList = [UIImageView]()
    var labelList     = [UILabel]()
    
    // 定义一个闭包
    //var didSelectedIndex: (Int) -> () = (Int) -> ()
    
    // 定义代理对象
    var delegate: XDTabBarAction?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        initUI(frame);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initUI(frame: CGRect) -> () {
        
        let itemCount = tabBarModelList.count
        
        let itemWidth: CGFloat = (SCREEN_WIDTH-right_retain)/CGFloat(itemCount)
        
        for i in 0 ..< itemCount {
            
            //view
            let viewFrame: CGRect = CGRect(x: itemWidth*CGFloat(i), y: frame.height-49, width: itemWidth, height: 49)
            let view: UIView = UIView(frame: viewFrame)
            view.tag = baseView_tag + i
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectedItemChange)))
            self.addSubview(view)
            
            let tabBarModel: XDTabBarModel = tabBarModelList[i]
            
            //imageView size 35*35
            let imgViewFrame: CGRect = CGRect(origin: CGPoint(x: (view.width-35)/2, y: 0), size: CGSize(width: 35, height: 35))
            let imageView: UIImageView = UIImageView(frame: imgViewFrame)
            imageView.image = UIImage(named: tabBarModel.image!)
            //imageView.image = UIImage(CGImage: tabBarModelList![i].image!)
            view.addSubview(imageView)
            imageViewList.append(imageView)
            
            //label width*14
            let labelFrame: CGRect = CGRect(x: 0, y: imageView.bottom, width: view.width, height: 14)
            let label: UILabel = UILabel(frame: labelFrame)
            label.textAlignment = .Center
            label.text = tabBarModel.title
            
            label.font = FONTSIZE_SMALL
            label.textColor = UIColor.grayColor()
            view.addSubview(label)
            labelList.append(label)
            
            if i == 0 {
                imageView.image = UIImage(named: tabBarModel.imageSelected!)
                label.textColor = GLOBAL_COLOR
            }
            
            if i == itemCount-1 {
                let btnFrame = CGRect(x: view.right, y: 0, width: right_retain, height: frame.height)
                let shoppingBtn = UIButton(frame: btnFrame)
                shoppingBtn.addTarget(self, action: #selector(shoppingCarHandle), forControlEvents: .TouchUpInside)
                self.addSubview(shoppingBtn)
            }
        }
        
        self.backgroundColor = UIColor(patternImage: UIImage(named: "tabbar-background-\(Int(SCREEN_WIDTH))")!)
    }
    
    func selectedItemChange(geture: UITapGestureRecognizer) {
        //print("tag: \(geture.view?.tag)")
        
        let index = (geture.view?.tag)!-baseView_tag
        
        // 交给代理处理其他事情
        delegate?.selectedIndexChange(index)
        
        for i in 0 ..< tabBarModelList.count {
            
            let label     = labelList[i]
            let imageView = imageViewList[i]
            
            let tabBarModel: XDTabBarModel = tabBarModelList[i]

            if i == index {
                imageView.image = UIImage(named: tabBarModel.imageSelected!)
                label.textColor = GLOBAL_COLOR
            } else {
                imageView.image = UIImage(named: tabBarModel.image!)
                label.textColor = UIColor.grayColor()
            }
        }
    }
    
    func shoppingCarHandle() {
        //print("shop handle")
        delegate?.shoppingCarHandle()
    }

}









