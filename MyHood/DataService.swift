//
//  DataService.swift
//  MyHood
//
//  Created by Diego Torres on 2/5/17.
//  Copyright © 2017 UNAMunam. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService() //singleton lives in memory and never dies
    let KEY_POSTS = "posts"
    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func savePosts() {
        //USING NSUSER DEFAULTS
        let postsData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts) //turn array into data
        UserDefaults.standard.set(postsData, forKey: KEY_POSTS) //storage mecanism, setting an object with a key
    
        
    }
    
    func loadPosts() {
        if let postsData = UserDefaults.standard.object(forKey: KEY_POSTS) as? Data{ //get data 
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData) as? [Post]{ //convert to array of posts
                _loadedPosts = postsArray //save to our array loadedposts
            }
            
        }
        
    }
    
    func saveImageAndCreatePath(image:UIImage) {
        
    }
    
    func imageForPath(path: String) {
        
    }
    
    func addPost(post:Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
}
