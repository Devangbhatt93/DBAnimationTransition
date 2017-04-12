//
//  DescriptionCell.swift
//  AnimatedTransitionDrawer
//
//  Created by devang.bhatt on 12/04/17.
//  Copyright © 2017 devang.bhatt. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {

    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        lblDescription.preferredMaxLayoutWidth = lblDescription.frame.width
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
