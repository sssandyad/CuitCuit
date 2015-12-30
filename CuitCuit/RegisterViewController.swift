//
//  RegisterViewController.swift
//  CuitCuit
//
//  Created by Sandy Dewangga on 12/28/15.
//  Copyright © 2015 Sandy Dewangga. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

  @IBOutlet var usernameTextField: UITextField!
  @IBOutlet var emailTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  
  @IBAction func signUpButton(sender: AnyObject) {
    
    let username = usernameTextField.text
    let email = emailTextField.text
    let password = passwordTextField.text
    let userDataRegistration = [username, email, password]
    
    if checkingUserRegistrationInput(userDataRegistration) {
      let user = PFUser()
      user.username = username
      user.password = password
      user.email = email
      user.signUpInBackgroundWithBlock({
        (succeded: Bool, error: NSError?) -> Void in
        if error == nil {
          print("Success")
          self.performSegueWithIdentifier("takeUserHome", sender: self)
        }
        else {
          print(error)
        }
      })
    }
  }
  
  func checkingUserRegistrationInput(userData: [String?]) -> Bool {
    var validation = true
    for data in userData {
      if data!.isEmpty {
        validation = false
        break
      }
    }
    return validation
  }
}
