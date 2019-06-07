//
//  CourseDetailViewController.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/6.
//  Copyright © 2019年 hyn. All rights reserved.
//

import UIKit
import SVProgressHUD
import SDWebImage
import PagingMenuController
class CourseDetailViewController: UIViewController {
    var mCourseId: Int
    var mCourseDetail: CourseDetailResponse.CourseDetail?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationItem()
        initView()
        initData()
        let label = UILabel()
        label.text = "Detail"
        label.frame = view.bounds
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
        // Do any additional setup after loading the view.
    }
    
    init(courseId: Int){
        self.mCourseId = courseId
        print(mCourseId)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initNavigationItem(){
        self.edgesForExtendedLayout = UIRectEdge.bottom
        navigationItem.title = "课程详情"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "topbar_back_normal")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(backClick))
    }
    
    func initView(){
        let imageLog = UIImageView()
    }
    
    func initData(){
        SVProgressHUD.show()
        var parameters = Dictionary<String, Int>()
        parameters["userId"] = -1
        let urlString = Constant.HOST+Constant.COACH_COUSER_DETAIL+String(self.mCourseId)
        NetworkManager.shared.getCourseDetail(urlString: urlString, parameters: parameters) { (courseDetailResponse) in
            if let courseDetail = courseDetailResponse{
                SVProgressHUD.dismiss()
                self.mCourseDetail = courseDetail
                self.showData(courseDetail: courseDetail)
            }else{
                print("没有数据")
            }
        }
    }
    
    @objc func backClick(){
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func showData(courseDetail: CourseDetailResponse.CourseDetail){
        
        //显示logo
        let imageLogo = UIImageView()
        let urlString = Constant.IMAGE_NET + courseDetail.mobileLogo!
        let url = URL(string: urlString)
        imageLogo.sd_setImage(with: url, placeholderImage: UIImage(named: "default_image"), options: SDWebImageOptions.continueInBackground, completed: nil)
        view.addSubview(imageLogo)
        
        //显示页面
        let options = PagingMenuOptions(courseDetail: courseDetail)
        //分页菜单控制器初始化
        let pagingMenuController = PagingMenuController(options: options)
        let viewline=UIView()
        
        //建立父子关系
        addChild(pagingMenuController)
        //分页菜单控制器视图添加到当前视图中
        view.addSubview(pagingMenuController.view)
        viewline.backgroundColor = UIColor.lightGray
        view.addSubview(viewline)
        
        for v in view.subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        view.addConstraint(NSLayoutConstraint(item: imageLogo,
                                              attribute: NSLayoutConstraint.Attribute.width,
                                              relatedBy: NSLayoutConstraint.Relation.equal,
                                              toItem: nil,
                                              attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                              multiplier: 1.0,
                                              constant: UIScreen.main.bounds.width))
        view.addConstraint(NSLayoutConstraint(item: imageLogo,
                                              attribute: NSLayoutConstraint.Attribute.height,
                                              relatedBy: NSLayoutConstraint.Relation.equal,
                                              toItem: nil,
                                              attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                              multiplier: 1.0,
                                              constant: UIScreen.main.bounds.width/2))
        
        view.addConstraint(NSLayoutConstraint(item: viewline,
                                              attribute: NSLayoutConstraint.Attribute.width,
                                              relatedBy: NSLayoutConstraint.Relation.equal,
                                              toItem: nil,
                                              attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                              multiplier: 1.0,
                                              constant: UIScreen.main.bounds.width))
        
        view.addConstraint(NSLayoutConstraint(item: viewline,
                                              attribute: NSLayoutConstraint.Attribute.height,
                                              relatedBy: NSLayoutConstraint.Relation.equal,
                                              toItem: nil,
                                              attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 0.5))
        
        view.addConstraint(NSLayoutConstraint(item: pagingMenuController.view,
                                              attribute: NSLayoutConstraint.Attribute.width,
                                              relatedBy: NSLayoutConstraint.Relation.equal,
                                              toItem: nil,
                                              attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                              multiplier: 1.0,
                                              constant: UIScreen.main.bounds.width))
        view.addConstraint(NSLayoutConstraint(item: pagingMenuController.view,
                                              attribute: NSLayoutConstraint.Attribute.height,
                                              relatedBy: NSLayoutConstraint.Relation.equal,
                                              toItem: nil,
                                              attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 400))
        
        view.addConstraint(NSLayoutConstraint(item: pagingMenuController.view,
                                              attribute: NSLayoutConstraint.Attribute.top,
                                              relatedBy: NSLayoutConstraint.Relation.equal,
                                              toItem: imageLogo,
                                              attribute: NSLayoutConstraint.Attribute.bottom,
                                              multiplier: 1.0,
                                              constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: viewline,
                                              attribute: NSLayoutConstraint.Attribute.top,
                                              relatedBy: NSLayoutConstraint.Relation.equal,
                                              toItem: pagingMenuController.menuView,
                                              attribute: NSLayoutConstraint.Attribute.bottom,
                                              multiplier: 1.0,
                                              constant: 0))
        
    }
    

    
    private struct PagingMenuOptions: PagingMenuControllerCustomizable {
        //第1个子视图控制器
        private let viewController1: IntroduceViewController?
        //第2个子视图控制器
        private let viewController2: TrafficViewController?
        //第3个子视图控制器
        private let viewController3: CommentViewController?
        
        init(courseDetail: CourseDetailResponse.CourseDetail) {
            viewController1 = IntroduceViewController(courseDetail: courseDetail)
            viewController2 = TrafficViewController(courseDetail: courseDetail)
            viewController3 = CommentViewController(courseDetail: courseDetail)
        }
        
        //组件类型
        fileprivate var componentType: ComponentType {
            return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
        }
        
        //所有子视图控制器
        fileprivate var pagingControllers: [UIViewController] {
            return [viewController1!, viewController2!, viewController3!]
        }
        
        //菜单配置项
        fileprivate struct MenuOptions: MenuViewCustomizable {
            //菜单显示模式
            var displayMode: MenuDisplayMode {
                return .segmentedControl
            }
            //菜单项
            var itemsOptions: [MenuItemViewCustomizable] {
                return [MenuItem1(), MenuItem2(), MenuItem3()]
            }
            
            var focusMode: MenuFocusMode{
                return .underline(height: 1.5, color: UIColor.red, horizontalPadding: 0, verticalPadding: 0)
            }
            
        }
        
        //第1个菜单项
        fileprivate struct MenuItem1: MenuItemViewCustomizable {
            //自定义菜单项名称
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: "介绍", color: UIColor.black, selectedColor: .red))
            }
        }
        
        //第2个菜单项
        fileprivate struct MenuItem2: MenuItemViewCustomizable {
            //自定义菜单项名称
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: "交通", color: UIColor.black, selectedColor: .red))
            }
        }
        
        //第3个菜单项
        fileprivate struct MenuItem3: MenuItemViewCustomizable {
            //自定义菜单项名称
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: "评论", color: UIColor.black, selectedColor: .red))
            }
        }
    }
    
}
