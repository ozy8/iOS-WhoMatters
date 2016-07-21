//
//  SignUpViewController.swift
//  WhoMatters
//
//  Created by Ow Zhiyin on 19/7/16.
//  Copyright © 2016 Ow Zhiyin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.selectPhoto(_:)))
        tap.numberOfTapsRequired = 1
        profileImage.addGestureRecognizer(tap)
    }
    
    func selectPhoto(tap: UITapGestureRecognizer){
        self.imagePicker.delegate = self
        self.imagePicker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            self.imagePicker.sourceType = .Camera
        }else {
            self.imagePicker.sourceType = .PhotoLibrary
        }
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    //this button allows for going back to the previous page
    @IBAction func CancelDidTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func SignUpDidTapped(sender: AnyObject) {
    }


}


extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
}