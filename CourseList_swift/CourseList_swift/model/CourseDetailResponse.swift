//
//  CourseDetailResponse.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/6.
//  Copyright © 2019年 hyn. All rights reserved.
//

import Foundation
struct CourseDetailResponse: Codable {
    var entity: Entity?
    var message: String?
    var success: Bool?
    
    struct Entity: Codable {
        var course: CourseDetail?
    }
    
    struct CourseDetail: Codable {
        var mobileLogo: String?
        var name: String?
        var liveBeginTime: String?
        var location: String?
        var facePlanCount: Int?
        var faceReserveCount: Int?
        var teacherList: [Teacher]?
        var context: String?
        var extraContext: String?
        var id: Int?
        
    }
    
    struct Teacher: Codable {
        var isStar: Int?//0:高级, 1:首席,2:专家,3:新秀
        var picPath: String?
        var name: String?
    }
}


