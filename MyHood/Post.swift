//
//  Post.swift
//  MyHood
//
//  Created by Diego Torres on 2/4/17.
//  Copyright © 2017 UNAMunam. All rights reserved.
//

import Foundation

class Post{
    
    private var imagePath:String
    private var title: String
    private var postDesc: String
    
    init(imagePath: String, title: String, description: String){
        self.imagePath = imagePath
        self.title = title
        self.postDesc = description
    }
}
