//
//  TableViewCell.swift
//  MyHood
//
//  Created by Diego Torres on 2/5/17.
//  Copyright © 2017 UNAMunam. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        // Initialization code
    }
    
    func configureCell(post: Post){ //takes in a type of class Post (immg, and 2 lbl)
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        
    }

}
