//
//  ViewController.swift
//  MyHood
//
//  Created by Diego Torres on 2/4/17.
//  Copyright © 2017 UNAMunam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadPosts()
        NotificationCenter.default.addObserver(self, selector: #selector(onPostsLoaded), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell{
            cell.configureCell(post: post)
            return cell
        }else{
            let cell = PostCell()
            cell.configureCell(post: post)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89.5
    }
    
    func onPostsLoaded(notif: Any) {
        tableView.reloadData()
    }





}

