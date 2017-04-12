//
//  SideViewCell.swift
//  AnimatedTransitionDrawer
//
//  Created by devang.bhatt on 12/04/17.
//  Copyright © 2017 devang.bhatt. All rights reserved.
//

import UIKit

class SideViewCell: UITableViewCell {

    @IBOutlet var imgIcon: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
