//
//  SignUpViewController.swift
//  WhoMatters
//
//  Created by Ow Zhiyin on 19/7/16.
//  Copyright © 2016 Ow Zhiyin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //this button allows for going back to the previous page
    @IBAction func CancelDidTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }



}
