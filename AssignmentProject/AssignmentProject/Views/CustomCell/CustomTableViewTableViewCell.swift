//
//  CustomTableViewTableViewCell.swift
//  AssignmentProject
//
//  Created by Vivekvardhan Kasthuri on 27/11/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import UIKit

class CustomTableViewTableViewCell: UITableViewCell {


    @IBOutlet var profileView: UIImageView!
    @IBOutlet  var titleLable: UILabel?
    @IBOutlet  var authorLable: UILabel?
    static var identifier = "customCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sizeToFit()
        layoutIfNeeded()
        profileView.layer.borderWidth = 1.0
        profileView.layer.masksToBounds = false
        profileView.layer.borderColor = UIColor.white.cgColor
        profileView.layer.cornerRadius = profileView.frame.size.width / 2
        profileView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateData(row: Row?) {
        self.authorLable?.text = row?.rowDescription
        self.titleLable?.text = row?.title
        if row?.imageHref != nil {
            self.profileView.loadImage(urlString: (row?.imageHref)!)
        }
    }
}
