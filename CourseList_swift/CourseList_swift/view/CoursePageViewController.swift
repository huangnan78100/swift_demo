//
//  CoursePageViewController.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/5.
//  Copyright © 2019年 hyn. All rights reserved.
//

import UIKit
import PagingMenuController
class CoursePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationItem()
        initPageView()
        // Do any additional setup after loading the view.
    }
    
    @objc func searchClick(){
        print("点击了搜索")
    }

    func initNavigationItem(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "topbar_search_normal")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(searchClick))
        navigationItem.title = "课程"
    }
    
    func initPageView(){
        
        //分页菜单配置
        let options = PagingMenuOptions()
        //分页菜单控制器初始化
        let pagingMenuController = PagingMenuController(options: options)
        //分页菜单控制器尺寸设置
        if let barHeight = tabBarController?.tabBar.frame.size.height{
            pagingMenuController.view.frame.size.height = pagingMenuController.view.frame.size.height-64-barHeight
        }else{
            pagingMenuController.view.frame.size.height = pagingMenuController.view.frame.size.height-64
        }
        pagingMenuController.view.frame.origin.y += 64
        
        var viewline: UIView?
        if let height = pagingMenuController.menuView?.frame.size.height {
            viewline = UIView(frame: CGRect(x: 0, y: 64 + height, width: UIScreen.main.bounds.width, height: 0.5))
        }
        
        //建立父子关系
        addChild(pagingMenuController)
        //分页菜单控制器视图添加到当前视图中
        view.addSubview(pagingMenuController.view)
        if let viewl = viewline {
            viewl.backgroundColor = UIColor.lightGray
            view.addSubview(viewl)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private struct PagingMenuOptions: PagingMenuControllerCustomizable {
        //第1个子视图控制器
        private let viewController1 = CourseListViewController(pageType: CourseListViewController.PageType.all)
        //第2个子视图控制器
        private let viewController2 = CourseListViewController(pageType: CourseListViewController.PageType.unstart)
        //第3个子视图控制器
        private let viewController3 = CourseListViewController(pageType: CourseListViewController.PageType.start)
        //第4个子视图控制器
        private let viewController4 = CourseListViewController(pageType: CourseListViewController.PageType.end)
        
        //组件类型
        fileprivate var componentType: ComponentType {
            return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
        }
        
        //所有子视图控制器
        fileprivate var pagingControllers: [UIViewController] {
            return [viewController1, viewController2, viewController3, viewController4]
        }
        
        //菜单配置项
        fileprivate struct MenuOptions: MenuViewCustomizable {
            //菜单显示模式
            var displayMode: MenuDisplayMode {
                return .segmentedControl
            }
            //菜单项
            var itemsOptions: [MenuItemViewCustomizable] {
                return [MenuItem1(), MenuItem2(), MenuItem3(), MenuItem4()]
            }
            
            var focusMode: MenuFocusMode{
                return .underline(height: 1.5, color: UIColor.red, horizontalPadding: 0, verticalPadding: 0)
            }
            
        }
        
        //第1个菜单项
        fileprivate struct MenuItem1: MenuItemViewCustomizable {
            //自定义菜单项名称
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: "全部", color: UIColor.black, selectedColor: .red))
            }
        }
        
        //第2个菜单项
        fileprivate struct MenuItem2: MenuItemViewCustomizable {
            //自定义菜单项名称
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: "未开始", color: UIColor.black, selectedColor: .red))
            }
        }
        
        //第3个菜单项
        fileprivate struct MenuItem3: MenuItemViewCustomizable {
            //自定义菜单项名称
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: "开始", color: UIColor.black, selectedColor: .red))
            }
        }
        
        //第4个菜单项
        fileprivate struct MenuItem4: MenuItemViewCustomizable {
            //自定义菜单项名称
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: "已结束", color: UIColor.black, selectedColor: .red))
            }
        }
    }

    
}



