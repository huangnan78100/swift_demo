//
//  IntroduceViewController.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/6.
//  Copyright © 2019年 hyn. All rights reserved.
//

import UIKit

class IntroduceViewController: UIViewController {
    var uiView: UIView?
    var mCourseDetail: CourseDetailResponse.CourseDetail?
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.edgesForExtendedLayout = UIRectEdge.bottom
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height-64-49-50-view.bounds.width/2))
//        label.text = "介绍"
//        label.textAlignment = .center
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
    
    var labelName: UILabel?
    var labelTime: UILabel?
    var labelAddress: UILabel?
    var labelStatus: UILabel?
    var labelCourseIn: UILabel?
    var view1: UIView?
    var webView: UIWebView?
    
    func addView(){
        labelName = UILabel()
        labelName?.text = mCourseDetail!.name ?? ""
        labelTime = UILabel()
        labelTime?.textColor = UIColor.lightGray
        labelTime?.font = UIFont.systemFont(ofSize: 14)
        labelTime?.text = mCourseDetail!.liveBeginTime ?? ""
        labelAddress = UILabel()
        labelAddress?.textColor = UIColor.lightGray
        labelAddress?.font = UIFont.systemFont(ofSize: 14)
        labelAddress?.text = mCourseDetail!.location ?? ""
        labelAddress?.numberOfLines = 2
        labelStatus = UILabel()
        labelStatus?.textColor = UIColor.red
        labelStatus?.font = UIFont.systemFont(ofSize: 15)
        let count = mCourseDetail!.facePlanCount! - mCourseDetail!.faceReserveCount!
        labelStatus?.text = "剩余名额："+String(count)
        labelCourseIn = UILabel()
        labelCourseIn?.textColor = UIColor.red
        labelCourseIn?.font = UIFont.systemFont(ofSize: 15)
        labelCourseIn?.text = "课程介绍"
        view1 = UIView()
        view1!.backgroundColor = UIColor.lightGray
        webView = UIWebView()
        webView?.scalesPageToFit = true
        
        let string = mCourseDetail!.context ?? ""
        webView?.loadHTMLString(string, baseURL: nil)
        
        uiView?.addSubview(labelName!)
        uiView?.addSubview(labelTime!)
        uiView?.addSubview(labelAddress!)
        uiView?.addSubview(labelStatus!)
        uiView?.addSubview(labelCourseIn!)
        uiView?.addSubview(view1!)
        uiView?.addSubview(webView!)
    }
    
    func addConstraint(){
        for view in uiView!.subviews{
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        uiView?.addConstraint(NSLayoutConstraint(item: labelName!,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: uiView,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 multiplier: 1.0,
                                                 constant: 16))
        uiView?.addConstraint(NSLayoutConstraint(item: labelName!,
                                                 attribute: NSLayoutConstraint.Attribute.left,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: uiView,
                                                 attribute: NSLayoutConstraint.Attribute.left,
                                                 multiplier: 1.0,
                                                 constant: 16))
        uiView?.addConstraint(NSLayoutConstraint(item: labelName!,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 200))
        
        uiView?.addConstraint(NSLayoutConstraint(item: labelTime!,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: labelName,
                                                 attribute: NSLayoutConstraint.Attribute.bottom,
                                                 multiplier: 1.0,
                                                 constant: 5))
        uiView?.addConstraint(NSLayoutConstraint(item: labelTime!,
                                                 attribute: NSLayoutConstraint.Attribute.leading,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: labelName,
                                                 attribute: NSLayoutConstraint.Attribute.leading,
                                                 multiplier: 1.0,
                                                 constant: 0))
        uiView?.addConstraint(NSLayoutConstraint(item: labelTime!,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 200))
        
        uiView?.addConstraint(NSLayoutConstraint(item: labelAddress!,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: labelTime,
                                                 attribute: NSLayoutConstraint.Attribute.bottom,
                                                 multiplier: 1.0,
                                                 constant: 5))
        uiView?.addConstraint(NSLayoutConstraint(item: labelAddress!,
                                                 attribute: NSLayoutConstraint.Attribute.leading,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: labelTime,
                                                 attribute: NSLayoutConstraint.Attribute.leading,
                                                 multiplier: 1.0,
                                                 constant: 0))
        uiView?.addConstraint(NSLayoutConstraint(item: labelAddress!,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 200))
        
        uiView?.addConstraint(NSLayoutConstraint(item: labelStatus!,
                                                 attribute: NSLayoutConstraint.Attribute.trailing,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: uiView,
                                                 attribute: NSLayoutConstraint.Attribute.trailing,
                                                 multiplier: 1.0,
                                                 constant: -16))
        uiView?.addConstraint(NSLayoutConstraint(item: labelStatus!,
                                                 attribute: NSLayoutConstraint.Attribute.centerY,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: labelTime,
                                                 attribute: NSLayoutConstraint.Attribute.centerY,
                                                 multiplier: 1.0,
                                                 constant: 4))
        uiView?.addConstraint(NSLayoutConstraint(item: labelStatus!,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 80))
        uiView?.addConstraint(NSLayoutConstraint(item: view1!,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: labelAddress,
                                                 attribute: NSLayoutConstraint.Attribute.bottom,
                                                 multiplier: 1.0,
                                                 constant: 4))
        
        uiView?.addConstraint(NSLayoutConstraint(item: view1!,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: uiView,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 multiplier: 1.0,
                                                 constant: 0))
        uiView?.addConstraint(NSLayoutConstraint(item: view1!,
                                                 attribute: NSLayoutConstraint.Attribute.height,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 0.5))
        
        uiView?.addConstraint(NSLayoutConstraint(item: labelCourseIn!,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: view1,
                                                 attribute: NSLayoutConstraint.Attribute.bottom,
                                                 multiplier: 1.0,
                                                 constant: 5))
        uiView?.addConstraint(NSLayoutConstraint(item: labelCourseIn!,
                                                 attribute: NSLayoutConstraint.Attribute.leading,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: labelAddress,
                                                 attribute: NSLayoutConstraint.Attribute.leading,
                                                 multiplier: 1.0,
                                                 constant: 0))
        uiView?.addConstraint(NSLayoutConstraint(item: labelCourseIn!,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 80))
        
        uiView?.addConstraint(NSLayoutConstraint(item: webView!,
                                                 attribute: NSLayoutConstraint.Attribute.top,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: labelCourseIn,
                                                 attribute: NSLayoutConstraint.Attribute.bottom,
                                                 multiplier: 1.0,
                                                 constant: 5))
        uiView?.addConstraint(NSLayoutConstraint(item: webView!,
                                                 attribute: NSLayoutConstraint.Attribute.leading,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: uiView,
                                                 attribute: NSLayoutConstraint.Attribute.leading,
                                                 multiplier: 1.0,
                                                 constant: 0))
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
