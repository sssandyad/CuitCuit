//
//  ViewController.swift
//  CuitCuit
//
//  Created by Sandy Dewangga on 12/28/15.
//  Copyright © 2015 Sandy Dewangga. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

  @IBOutlet var usernameLogin: UITextField!
  @IBOutlet var passwordLogin: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    PFUser.logOut()
  }

  @IBAction func loginButton(sender: AnyObject) {
    
    if let username = usernameLogin.text, password = passwordLogin.text {
      
      PFUser.logInWithUsernameInBackground(username, password: password, block: {
        (user:PFUser?, error: NSError?) -> Void in
        
        if let _ = PFUser.currentUser() {
          self.performSegueWithIdentifier("loginGoHome", sender: self)
        }
        else {
          let errorAlert = UIAlertController(title: "Oops!", message: "Invalid username or password", preferredStyle: .Alert)
          errorAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
          }))
          self.presentViewController(errorAlert, animated: true, completion: nil)
        }
      })
    }
    else {
      let errorAlert = UIAlertController(title: "Oops!", message: "username or password is empty", preferredStyle: .Alert)
      errorAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
        self.dismissViewControllerAnimated(true, completion: nil)
      }))
      self.presentViewController(errorAlert, animated: true, completion: nil)

    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

