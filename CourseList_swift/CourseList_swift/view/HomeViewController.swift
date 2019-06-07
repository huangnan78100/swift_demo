//
//  HomeViewController.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/5.
//  Copyright © 2019年 hyn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "Home"
        label.frame = view.bounds
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
        // Do any additional setup after loading the view.
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
