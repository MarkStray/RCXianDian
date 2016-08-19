//
//  ProductDetailViewController.swift
//  RCXianDian
//
//  Created by user on 16/8/8.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ProductDetailViewController: XDBaseViewController {
    
    //MARK:- Instance Varible
    var purchaseView: PurchaseView!
    var bottomView: UIView!
    
    var detailTableView: XDTableView!
    
    let titleList = ["品名:", "价格:", "规格:", "描述:"]
    var detailList = [String]()
    
    var tableHeaderView = UIImageView()

    private lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .Custom)
        backBtn.setBackgroundImage(UIImage(named: "backArrow"), forState: .Normal)
        backBtn.addTarget(self, action: #selector(backBtnAction), forControlEvents: .TouchUpInside)
        backBtn.layer.masksToBounds = true
        backBtn.layer.cornerRadius = 15
        backBtn.backgroundColor = CELL_DARK_COLOR
        backBtn.alpha = 0.5
        return backBtn
    }()

    /// 详情页产品ID
    var productId: String?
    var productDetailModel: ProductModel?
    private var productDetailCallInfo: ProductDetailCallInfo? {
        didSet {
            productDetailModel = productDetailCallInfo?.CallInfo
            
            asyncImgVLoadingImage(tableHeaderView, urlStr: productDetailModel?.imgurl)
            
            if let skuname = productDetailModel?.skuname {
                detailList.append(skuname)
            } else {
                detailList.append("")
            }
            
            if 1 == productDetailModel?.onsale {
                
                var priceStr = ""
                
                if let price = productDetailModel?.price {
                    priceStr += "促销" + price + "元/份"
                }
                
                if let saleprice = productDetailModel?.price {
                    priceStr += " 原价" + saleprice + "元/份"
                }
                
                if priceStr.isEmpty {
                    detailList.append("")
                } else {
                    detailList.append(priceStr)
                }
                
                
            } else {
                if var price = productDetailModel?.price {
                    price += "元/份"
                    detailList.append(price)
                } else {
                    detailList.append("")
                }
            }
            
            if let spec = productDetailModel?.spec {
                detailList.append(spec)
            } else {
                detailList.append("")
            }
            
            if let remark = productDetailModel?.remark {
                detailList.append(remark)
            } else {
                detailList.append("")
            }

            detailTableView.reloadData()
        }
    }

    
    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBottomView()
        
        initDetailTableView()
        
        initBackBtn()

        requestProductDetailData()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
        showTabBar()
        purchaseView.delegate = self
        UIApplication.sharedApplication().keyWindow?.addSubview(bottomView)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBarHidden = false
        hideTabBar()
        purchaseView.delegate = nil
        bottomView.removeFromSuperview()
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .Default
    }

    //MARK:- UI Initial

    func initDetailTableView() {
        detailTableView = XDTableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49), style: .Plain)
        detailTableView.delegate = self
        detailTableView.dataSource = self
        tableHeaderView.height = 200
        detailTableView.tableHeaderView = tableHeaderView
        view.addSubview(detailTableView)
    }
    
    func initBottomView() {
        bottomView = UIView(frame: CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH-80, 49))
        bottomView.backgroundColor = UIColor.whiteColor()
        
        purchaseView = PurchaseView(frame: CGRectMake(45, 12, 80, 25))
        bottomView.addSubview(purchaseView)
    }

    
    func initBackBtn() {
        view.addSubview(backBtn)
        backBtn.snp_makeConstraints { (make) in
            make.left.equalTo(view).offset(16)
            make.top.equalTo(view).offset(30)
            make.width.equalTo(45)
            make.height.equalTo(30)
        }
    }
    
    //MARK:- Data Request
    func requestProductDetailData() {
        ProductDetailCallInfo.requestProductDetailDataWithProductId(productId) { (productDetailCallInfo) in
            printLog(productDetailCallInfo!.toJSON())
            self.productDetailCallInfo = productDetailCallInfo
        }
    }

    
    //MARK:- Actions 
    func backBtnAction() {
        navigationController?.popViewControllerAnimated(true)
    }
}
//MARK:- Extension

//MARK:- UITableView delegate & dataSource
extension ProductDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return height(35, str: detailList[indexPath.row], width: SCREEN_WIDTH-16*2-60, fSize: 14)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CELLIDENTIFIER = "ProductDetailTableViewCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(CELLIDENTIFIER) as? ProductDetailTableViewCell
        if cell == nil {
            cell = ProductDetailTableViewCell(style: .Default, reuseIdentifier: CELLIDENTIFIER)
        }
        
        cell?.titleLabel.text = titleList[indexPath.row]
        cell?.detailLabel.text = detailList[indexPath.row]
        
        return cell!
    }
    
}

//MARK:- PurchaseViewDelegate
extension ProductDetailViewController: PurchaseViewDelegate {
    
    func purchaseViewAddBtnClicked() {
        if productDetailModel!.onsale == 1 {
            if purchaseView.number == Int(productDetailModel!.saleamount!)! {
                showAlertView("亲,本促销品每单限购\(Int(productDetailModel!.saleamount!)!)份!")
                return
            }
        }
        
        productDetailModel!.count += 1
        
        if !(ShoppingCarManager.sharedShoppingCar.updateCarProductsModel(productDetailModel!)) {
            productDetailModel!.count -= 1;
        }
        
        purchaseView.number = productDetailModel!.count
    }
    
    func purchaseViewReduceBtnClicked() {
        productDetailModel!.count -= 1
        purchaseView.number = productDetailModel!.count
        ShoppingCarManager.sharedShoppingCar.updateCarProductsModel(productDetailModel!)
    }
    
    func purchaseViewInputViewClicked() {
        //let input = InputViewController()
        //input.show()
    }
}


