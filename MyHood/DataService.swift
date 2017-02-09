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
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
        
    }
    
    func saveImageAndCreatePath(image:UIImage) -> String{
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate).png"
        let fullPath = documentsPathForFileName(name: imgPath)
        do{
            try imgData?.write(to: URL(fileURLWithPath: fullPath), options: .atomic)
        }catch{
            print(error)
        }
        return imgPath
    }
    
    
    func imageForPath(path: String) -> UIImage?{
        let fullPath = documentsPathForFileName(name: path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(post:Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    //directory to load and save images
    func documentsPathForFileName(name: String) -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) //returns array and we need the first
        let fullPath = paths[0] as NSString
        return fullPath.strings(byAppendingPaths: [name]).description
    }
    
}
