//
//  CreateRoomViewController.swift
//  WhoMatters
//
//  Created by Ow Zhiyin on 19/7/16.
//  Copyright © 2016 Ow Zhiyin. All rights reserved.
//

import UIKit

class CreateRoomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    

    @IBAction func CancelDidTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
