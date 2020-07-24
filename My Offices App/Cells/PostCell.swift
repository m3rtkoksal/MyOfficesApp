//
//  ItemCell.swift
//  My Offices App
//
//  Created by Mert Köksal on 24.07.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var officeNameLabel: UILabel!
    @IBOutlet weak var officePhoneLabel: UILabel!
    @IBOutlet weak var officeEmailLabel: UILabel!
    @IBOutlet weak var officeAddressLabel: UILabel!
    
    func configureCell(post: Post) {
        officeNameLabel.text = post.officeName
        officePhoneLabel.text = post.officeName
        officeEmailLabel.text = post.officeEmail
        officeAddressLabel.text = post.officeEmail
    }
}
