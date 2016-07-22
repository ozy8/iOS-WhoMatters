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
    var selectedPhoto: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.selectPhoto(_:)))
        tap.numberOfTapsRequired = 1
        profileImage.addGestureRecognizer(tap)
        
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.clipsToBounds = true
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
        guard let email = emailTextField.text where !email.isEmpty,
                let password = passwordTextField.text where !password.isEmpty,
            let username = usernameTextField.text where !username.isEmpty else {
                return
        }
        
        var data = NSData()
        data = UIImageJPEGRepresentation(profileImage.image!, 0.1)!
        // Signing Up
        ProgressHUD.show("Please wait...", interaction: false)
        DataService.dataService.SignUp(username, email: email, password: password, data: data)
        
    }
    

}


extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // ImagePicker Delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        selectedPhoto = info[UIImagePickerControllerEditedImage] as? UIImage
        self.profileImage.image = selectedPhoto
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

















