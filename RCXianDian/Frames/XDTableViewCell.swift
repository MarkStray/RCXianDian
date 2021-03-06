//
//  XDTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class XDTableViewCell: UITableViewCell {
    
    var lineView = UIView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialConfig()
        
        initialUI()
    }
    
    func initialConfig() {
        self.selectionStyle = .None
        
        lineView.backgroundColor = LINE_COLOR
        contentView.addSubview(lineView)
        
        lineView.hidden = true
    }
    
    /**
     子类继承 XDTableViewCell 重载 initialUI() 方法构建UI
     
     - returns: Void
     */
    func initialUI() {
        fatalError("method initialUI has not been implemented in subclass")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
