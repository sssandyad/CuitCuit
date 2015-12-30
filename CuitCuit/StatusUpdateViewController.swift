//
//  StatusUpdateViewController.swift
//  CuitCuit
//
//  Created by Sandy Dewangga on 12/29/15.
//  Copyright © 2015 Sandy Dewangga. All rights reserved.
//

import UIKit
import Parse

class StatusUpdateViewController: UIViewController {

  @IBOutlet var statusUpdateTextField: UITextField!
  
  @IBAction func updateStatusButton(sender: AnyObject) {
    
    
    
    if let status = statusUpdateTextField.text {
      let statusUpdate = PFObject(className: "Status")
      statusUpdate["newStatus"] = status
      statusUpdate["user"] = PFUser.currentUser()?.username
      statusUpdate.saveInBackgroundWithBlock({
        (isSuccessful: Bool, error: NSError?) -> Void in
        if error == nil {
          print(isSuccessful)
        }
        else {
          print(error)
        }
      })
    }
  }
}
