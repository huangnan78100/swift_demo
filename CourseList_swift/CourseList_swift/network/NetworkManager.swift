//
//  File.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/6.
//  Copyright © 2019年 hyn. All rights reserved.
//

import Foundation
import AFNetworking
class NetworkManager: AFHTTPSessionManager {
    
    static let shared = NetworkManager()
    
    func getCourseList(parameters: Dictionary<String, Any>, completion: @escaping (_ courses: [CourseResponse.Course]?, _ totalPageSize: Int?)->Void){
        let urlString = Constant.HOST+Constant.COACH_COUSER_LIST
        
        post(urlString, parameters: parameters, progress: nil, success: { (_, json) in
            do{
                let decodable = JSONDecoder()
                let jsonData = try JSONSerialization.data(withJSONObject: json ?? [], options: [])
                let model: CourseResponse = try decodable.decode(CourseResponse.self, from: jsonData)
                if(model.success ?? false){
                    completion(model.entity?.courseList, model.entity?.page?.totalPageSize)
                }else{
                    completion(nil, -1)
                }
                
            }catch let error{
                print(error)
            }
            
        }) { (_, error) in
            print(error)
        }
    }
    
    func getCourseDetail(urlString: String, parameters: Dictionary<String, Int>, completion: @escaping (_ courseDetail: CourseDetailResponse.CourseDetail?)->Void){
        
        get(urlString, parameters: parameters, progress: nil, success: { (_, json) in
            do{
                let decodable = JSONDecoder()
                let jsonData = try JSONSerialization.data(withJSONObject: json ?? [], options: [])
                let model: CourseDetailResponse = try decodable.decode(CourseDetailResponse.self, from: jsonData)
                if(model.success ?? false){
                    completion(model.entity?.course)
                }else{
                    completion(nil)
                }
                
            }catch let error{
                print(error)
            }
            
        }) { (_, error) in
            print(error)
        }
    }
    
    func getCommentList(urlString: String, parameters: Dictionary<String, Int>, completion: @escaping (_ comments: [CommentResponse.Comment]?)->Void){
        
        post(urlString, parameters: parameters, progress: nil, success: { (_, json) in
            do{
                let decodable = JSONDecoder()
                let jsonData = try JSONSerialization.data(withJSONObject: json ?? [], options: [])
                let model: CommentResponse = try decodable.decode(CommentResponse.self, from: jsonData)
                if(model.success ?? false){
                    completion(model.entity?.assessList)
                }else{
                    completion(nil)
                }
                
            }catch let error{
                print(error)
            }
            
        }) { (_, error) in
            print(error)
        }
    }
    
    
    }
