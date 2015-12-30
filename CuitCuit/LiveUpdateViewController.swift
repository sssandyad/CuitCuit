//
//  LiveUpdateViewController.swift
//  CuitCuit
//
//  Created by Sandy Dewangga on 12/29/15.
//  Copyright © 2015 Sandy Dewangga. All rights reserved.
//

import UIKit
import Parse

class LiveUpdateViewController: UIViewController, UITableViewDelegate {

  @IBOutlet var homeTableView: UITableView!
  
  var mObjects = [PFObject]?()
  var userNames = [String]()
  var userStatuses = [String]()
  
  override func viewDidLoad() {
    print("user: \(PFUser.currentUser()!["username"])")
    let queryStatus = PFQuery(className: "Status")
    queryStatus.orderByDescending("createdAt")
    queryStatus.findObjectsInBackgroundWithBlock {( objects: [PFObject]?, error: NSError?) -> Void in
      if error == nil {
        //print(objects)
        self.mObjects = objects
        for object in objects! {
          self.userNames.append(object["user"] as! String)
          self.userStatuses.append(object["newStatus"] as! String)
          //print(self.userNames[0])
          
          self.homeTableView.reloadData()
        }
      }
      else {
        print("no object found")
      }
    }
  }
  
  override func viewDidLayoutSubviews() {
    if let _ = PFUser.currentUser() {
      
    } else {
      performSegueWithIdentifier("logOut", sender: self)
    }
  }
  
  func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    if self.mObjects?.count != nil {
      return self.mObjects!.count
    } else {
      return 0
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell? {
    
    let myCell: StatusCell = tableView.dequeueReusableCellWithIdentifier("statusCell") as! StatusCell
    
    myCell.usernameLabel.text = userNames[indexPath.row]
    myCell.statusLabel.text = userStatuses[indexPath.row]
    
    return myCell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    let viewController: StatusDetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("statusDetailStoryboard") as! StatusDetailViewController
    viewController.status = userStatuses[indexPath.row]
    viewController.titleBar = userNames[indexPath.row]
    self.presentViewController(viewController, animated: true, completion: nil)
  }
}
