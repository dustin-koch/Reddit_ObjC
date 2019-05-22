//
//  RedditPostsViewController.swift
//  Reddit_ObjC
//
//  Created by Dustin Koch on 5/22/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit

class RedditPostsViewController: UIViewController {

    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        DHKRedditPostController.shared().fetchPosts { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("Didn't fetch posts")
            }
        }
    }
    

}//END OF CLASS

extension RedditPostsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DHKRedditPostController.shared().posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        let post = DHKRedditPostController.shared().posts[indexPath.row]
        DHKRedditPostController.shared().fetchImage(for: post) { (image) in
            DispatchQueue.main.async {
                cell.imageView?.image = image
            }
        }
        cell.textLabel?.text = post.title
        
        return cell
    }
}//END OF EXTENSION
