//
//  CommentResponse.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/7.
//  Copyright © 2019年 hyn. All rights reserved.
//

import Foundation
struct CommentResponse: Codable {
    var entity: Entity?
    var message: String?
    var success: Bool?
    
    struct Entity: Codable {
        var assessList: [Comment]?
    }
    
    struct Comment: Codable {
        var avatar: String?
        var loginAccount: String?
        var createTime: String?
        var content: String?
        
    }
    
}
