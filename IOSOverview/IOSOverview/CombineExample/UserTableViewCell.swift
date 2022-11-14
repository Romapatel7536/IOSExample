//
//  UserTableViewCell.swift
//  IOSOverview
//
//  Created by Roma Patel on 09/11/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userDetailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(details: String) {
        self.userDetailsLabel.text = details
    }
}
