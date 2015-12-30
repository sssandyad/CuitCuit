//
//  StatusDetailViewController.swift
//  CuitCuit
//
//  Created by Sandy Dewangga on 12/29/15.
//  Copyright © 2015 Sandy Dewangga. All rights reserved.
//

import UIKit

class StatusDetailViewController: UIViewController {
  
  @IBOutlet var statusDetailLabel: UILabel!
  @IBOutlet var navBar: UINavigationBar!
  var status: String?
  var titleBar: String?
  
  override func viewDidLoad() {
    statusDetailLabel.text = status
    navBar.topItem?.title = titleBar
  }
  
}
