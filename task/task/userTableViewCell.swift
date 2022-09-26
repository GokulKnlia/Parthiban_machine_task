//
//  userTableViewCell.swift
//  task
//
//  Created by Apple on 26/09/22.
//

import UIKit

class userTableViewCell: UITableViewCell {

    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userImgVw: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
