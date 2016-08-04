## RCXianDian项目
## 项目文件目录组织形式:

Frames      -- 入口 基类文件 
Classes     -- 模块文件
Custom      -- 拓展类 配置类 帮助类 工具类 全局共用视图类
            -- Config 固化数据结构类
            -- Handler 网络请求处理
            -- Tools 文件管理 序列化 反序列化 HUD
            -- Helper 辅助功能类
            -- Views 基类 全局视图类

Files       -- 常量 头文件 宏 PCH Plist文件 配置文件 Storyboard
Public      -- github第三方类
Vendor      -- 分享 支付模块
General     -- 网络项目 工具类 
Helper      -- 个人项目 工具类 

xxxClasses ----> 
模块文件: 包含Controllers Views Models Others Images
分别放置MVC相关文件及本模块的工具类，图片资源 @2x
另有xxxPartClasses是本模块延伸出来的相关模块 其下的文件组织形式和xxxClasses模块下一致 

PS: Assets.xcassets和Images区别
Images 存放模块图片资源
Assets.xcassets 存放公共的图片资源 TabBar图片资源

PS: 务必按照以上规则放置文件 方便管理 易于维护  

## 项目代码组织形式:

//MARK:- Instance Varible
//MARK:- Life Circle
//MARK:- UI Initial
//MARK:- Data Request
//MARK:- Action
//MARK:- xxxExtension

PS: 善用一下语法标记
//MARK:  标记
//TODO:  待做
//FIXME: 修改


PS: 引入第三方库功能及使用
1. model层处理使用ObjectMapper 弃用原来的JSONModel 使用参考HomeCallInfo类
2. 网络层使用Alamofire 使用参考HomeCallInfo类
3. 布局库使用SnapKit 弃用Masonry(语法复杂) 使用参考PersonHeaderView类
4. HUD使用SVProgress 弃用MBProgress
5. 异步图片加载使用SDWebImage

