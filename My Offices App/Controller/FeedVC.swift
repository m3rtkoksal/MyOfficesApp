//
//  FeedVC.swift
//  My Offices App
//
//  Created by Mert Köksal on 23.07.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
   
    var filteredPost = [Post]()
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DataService.ds.REF_POSTS.observe(.value, with: { snapshot in
            self.posts = []
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    if let postDict = snap.value as? Dictionary<String,AnyObject> {
                        let key = snap.key
                        let post = Post(postID: key, postData: postDict)
                        self.posts.append(post)
                    }
                }
            }
            self.tableView.reloadData()
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell {
            let post = posts[indexPath.row]
            cell.configureCell(post: post)
            return cell
        }
        return PostCell()
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let post = posts[indexPath.row]
//        let alertController = UIAlertController(title: post.officeName, message: "update values", preferredStyle: .alert)
//        let updateAction = UIAlertAction(title: "Update", style: .default) { (_) in
//        }
//        let deleteAction = UIAlertAction(title: "Delete", style: .default) { (_) in
//            alertController.addTextField { (textField) in
//                textField.text = post.officeName
//            }
//        }
//        alertController.addAction(updateAction)
//        alertController.addAction(deleteAction)
//
//        present(alertController,animated: true, completion: nil)
//    }
//
    
    
}
