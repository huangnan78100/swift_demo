//
//  TrafficViewController.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/6.
//  Copyright © 2019年 hyn. All rights reserved.
//

import UIKit

class TrafficViewController: UIViewController {
    var uiView: UIView?
    var mCourseDetail: CourseDetailResponse.CourseDetail?
    override func viewDidLoad() {
        super.viewDidLoad()
//        let label = UILabel()
//        label.text = "交通"
//        label.frame = view.bounds
//        label.sizeToFit()
//        label.center = view.center
//
//        view.addSubview(label)
        
        uiView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height-64-49-view.bounds.width/2))
        view.addSubview(uiView!)
        addView()
        addConstraint()
        
        
        // Do any additional setup after loading the view.
    }
    
    init(courseDetail: CourseDetailResponse.CourseDetail){
        self.mCourseDetail = courseDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var webView: UIWebView?
    func addView(){
        webView = UIWebView()
        webView?.scalesPageToFit = true
        
        let string = mCourseDetail!.extraContext ?? ""
        webView?.loadHTMLString(string, baseURL: nil)
        uiView?.addSubview(webView!)
        webView?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addConstraint(){
        uiView?.addConstraint(NSLayoutConstraint(item: webView!,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: uiView,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 multiplier: 1.0,
                                                 constant: 16))
        uiView?.addConstraint(NSLayoutConstraint(item: webView!,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: uiView,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 multiplier: 1.0,
                                                 constant: 0))
        uiView?.addConstraint(NSLayoutConstraint(item: webView!,
                                                 attribute: NSLayoutConstraint.Attribute.bottom,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: uiView,
                                                 attribute: NSLayoutConstraint.Attribute.bottom,
                                                 multiplier: 1.0,
                                                 constant: 0))
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
