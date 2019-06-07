//
//  Course.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/6.
//  Copyright © 2019年 hyn. All rights reserved.
//

import Foundation
struct CourseResponse: Codable {
    var entity: Entity?
    var message: String?
    var success: Bool?
    
    struct Entity: Codable{
        var page: Page?
        var courseList: [Course]?
    }
    
    struct Page: Codable {
        var currentPage: Int?
        var endRecord: Int?
        var last: Bool
        var pageSize: Int?
        var startRecord: Int?
        var startRow: Int?
        var totalPageSize: Int?
        var totalResultSize: Int?
    }
    
    struct Course: Codable {
        //课程id
        var id: Int
        
        //课程图片
        var mobileLogo: String?
        
        //课程名称
        var name: String?
        
        //日期
        var liveBeginTime: String?
        
        //状态
        var status: Int?
        
        
    }
}


