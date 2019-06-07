//
//  CourseListViewController.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/5.
//  Copyright © 2019年 hyn. All rights reserved.
//

import UIKit
import MJRefresh
import SDWebImage
class CourseListViewController: UIViewController {
    var tableView: UITableView?
    var pageType:PageType
    var data: [CourseResponse.Course]?
    var mPage = 1
    var mStatus = 0
    enum PageType {
        case all
        case unstart
        case start
        case end
    }
    
    init(pageType:PageType) {
        self.pageType = pageType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initParam()
        initNodataView()
        initTableView()
        initData()
        
        // Do any additional setup after loading the view.
    }
    
    func initParam(){
        switch pageType {
        case PageType.all:
            mStatus = 0
        case PageType.unstart:
            mStatus = 1
        case PageType.start:
            mStatus = 2
        case PageType.end:
            mStatus = 3
        }
    }
    
    func initNodataView() {
        let height = view.frame.size.height-64-49-50
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height))
        label.text = "没有数据"
        label.textAlignment = .center
        view.addSubview(label)
    }
    
    func initTableView() {
        let height = view.frame.size.height-64-49-50
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height), style: UITableView.Style.plain)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UINib(nibName: "CourseTableViewCell", bundle: nil), forCellReuseIdentifier: "cellid")
        tableView?.mj_header = MJRefreshNormalHeader(){
            self.refreshData()
        }
        tableView?.mj_footer = MJRefreshBackNormalFooter(){
            self.loadMoreData()
        }
        view.addSubview(tableView!)
    }
    
    func refreshData() {
        tableView?.mj_footer.state = .idle
        getCourseData(page: 1)
    }
    
    func loadMoreData() {
        self.mPage = self.mPage+1
        getCourseData(page: self.mPage)
    }
    
    func initData() {
        tableView?.mj_footer.state = .idle
        getCourseData(page: 1)
    }

    func getCourseData(page: Int){
        self.mPage = page
        var parameters = Dictionary<String, Any>()
        parameters["queryCourse.status"] = mStatus
        parameters["page.currentPage"] = page
        parameters["page.pageSize"] = "12"
        NetworkManager.shared.getCourseList(parameters: parameters) { (arrayCourse, totalPageSize) in
            if let courses = arrayCourse,
               let pageSize = totalPageSize{
                self.tableView?.isHidden = false
                if(page == 1){
                    self.data?.removeAll()
                    self.data = courses
                    self.tableView?.mj_header.endRefreshing()
                }else{
                    self.data = self.data! + courses
                    if(self.mPage >= pageSize){
                        self.tableView?.mj_footer.endRefreshingWithNoMoreData()
                    }else{
                        self.tableView?.mj_footer.endRefreshing()
                    }
                }
                self.tableView?.reloadData()
            }else{
                self.tableView?.isHidden = true
            }
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

}

extension CourseListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! CourseTableViewCell
        cell.courseName?.text = data?[indexPath.row].name
        cell.date.text = data?[indexPath.row].liveBeginTime
        if data?[indexPath.row].status == 3{
            cell.status.text = "已结束"
        }else{
            cell.status.text = "未开始"
        }
        var stringUrl=""
        if let url = data?[indexPath.row].mobileLogo{
            stringUrl = Constant.IMAGE_NET + url
        }
        
        let url = URL(string: stringUrl)
        cell.courseImage.sd_setImage(with: url, placeholderImage: UIImage(named: "default_image"), options: SDWebImageOptions.continueInBackground, completed: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let courseId = data?[indexPath.row].id{
            let courseDetailVc = CourseDetailViewController(courseId: courseId)
            navigationController?.pushViewController(courseDetailVc, animated: true)
        }
    }
}
