//
//  CourseTableViewCell.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/6.
//  Copyright © 2019年 hyn. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var courseImage: UIImageView!
    
    @IBOutlet weak var courseName: UILabel!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
