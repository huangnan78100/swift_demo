//
//  CommentViewController.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/6.
//  Copyright © 2019年 hyn. All rights reserved.
//

import UIKit
import MJRefresh
import SDWebImage
class CommentViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    var mCourseDetail: CourseDetailResponse.CourseDetail?
    var tableView: UITableView?
    var mCommentArr: [CommentResponse.Comment]?
    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
        initData()
        // Do any additional setup after loading the view.
    }
    
    init(courseDetail: CourseDetailResponse.CourseDetail){
        self.mCourseDetail = courseDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initTable(){
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height-64-49-view.bounds.width/2))
        view.addSubview(tableView!)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "cellid")
        
        tableView?.mj_header = MJRefreshNormalHeader(){
            self.initData()
        }
    }
    
    func initData(){
        
        let string = Constant.HOST + Constant.COACH_COURSE_COMMENT
        var parameters = Dictionary<String , Int>()
        parameters["courseId"] = mCourseDetail?.id ?? 0
        parameters["page.currentPage"] = 1
        parameters["userId"] = -1
        
        NetworkManager.shared.getCommentList(urlString: string, parameters: parameters) { (comments) in
            if let commentArr = comments{
               self.mCommentArr = commentArr
                self.tableView?.reloadData()
            }else{
               self.tableView?.isHidden = true
            }
            self.tableView?.mj_header.endRefreshing()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mCommentArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! CommentTableViewCell
        cell.userName.text = self.mCommentArr?[indexPath.row].loginAccount ?? ""
        cell.time.text = self.mCommentArr?[indexPath.row].createTime ?? ""
        cell.content.text = self.mCommentArr?[indexPath.row].content ?? ""
        cell.count.text = "0"
        let string = Constant.IMAGE_NET + (self.mCommentArr?[indexPath.row].avatar ?? "")
        let url = URL(string: string)
        cell.avatar.layer.masksToBounds = true
        cell.avatar.layer.cornerRadius = cell.avatar.frame.size.width * 0.5
        cell.avatar.sd_setImage(with: url, placeholderImage: UIImage(named: "default_image"), options: SDWebImageOptions.continueInBackground, completed: nil)
        return cell
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
