//
//  TableViewCell.swift
//  TableViewCollection1
//
//  Created by Van Dong on 04/06/2019.
//  Copyright © 2019 VanDong. All rights reserved.
//

import UIKit
//khi dem so cell duoc khoi tao
//var count = 0
class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        //mỗi một cell khi khởi tạo sẽ phải chạy qua awakeFromNib 1 lần duy nhất và được gắn 1 detail
//        detailTextLabel?.text = "\(count)"
//        count += 1
    }
    // de khac phuc tinh trang cell boi xanh bi lap di lap lai can goi ham:
    override func prepareForReuse() {
        textLabel?.text = nil
        detailTextLabel?.text = ""
        backgroundColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
