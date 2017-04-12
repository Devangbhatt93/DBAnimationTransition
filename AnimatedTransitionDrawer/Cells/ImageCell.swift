//
//  ImageCell.swift
//  AnimatedTransitionDrawer
//
//  Created by devang.bhatt on 12/04/17.
//  Copyright © 2017 devang.bhatt. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var lblProfileName: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
