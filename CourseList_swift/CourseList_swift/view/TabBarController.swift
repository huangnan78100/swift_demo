//
//  TabBarController.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/5.
//  Copyright © 2019年 hyn. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addvc()
    
        // Do any additional setup after loading the view.
    }
    
    func addvc(){
        let homeVc = HomeViewController()
        let coursePageVc = CoursePageViewController()
        let courseVc = CourseNavigaController(rootViewController: coursePageVc)
        let mineVc = MineViewController()
        
        homeVc.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named: "btn_tab_home_normal"), selectedImage: UIImage(named: "btn_tab_home_selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        homeVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 100)], for: UIControl.State.highlighted)
        
        courseVc.tabBarItem = UITabBarItem(title: "课程", image: UIImage(named: "btn_tab_elective_normal"), selectedImage: UIImage(named: "btn_tab_elective_selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        courseVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 100)], for: UIControl.State.highlighted)
        
        mineVc.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "btn_tab_mine_normal"), selectedImage: UIImage(named: "btn_tab_mine_selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
        mineVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 100)], for: UIControl.State.highlighted)
        var arrVcs = [UIViewController]()
        arrVcs.append(homeVc)
        arrVcs.append(courseVc)
        arrVcs.append(mineVc)
        self.tabBar.barTintColor = UIColor.white
        self.viewControllers = arrVcs
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
