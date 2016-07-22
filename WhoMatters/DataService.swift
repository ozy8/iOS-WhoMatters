//
//  DataService.swift
//  WhoMatters
//
//  Created by Ow Zhiyin on 21/7/16.
//  Copyright © 2016 Ow Zhiyin. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage

class DataService {
    
    static let dataService = DataService()
    
    private var _BASE_REF = FIRDatabase.database().reference()
    
    var BASE_REF: FIRDatabaseReference {
        return _BASE_REF
    }
    
    var storageRef: FIRStorageReference{
        return FIRStorage.storage().reference()
    }
    
    var fileUrl: String!
    
    func SignUp(username: String, email: String, password: String, data: NSData) {
        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            let changeRequest = user?.profileChangeRequest()
            changeRequest?.displayName = username
            changeRequest?.commitChangesWithCompletion({ (error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
            })
            let filePath = "profileImage/\(user!.uid)"
            let metadata = FIRStorageMetadata()
            metadata.contentType = "image/jpeg"
            
            self.storageRef.child(filePath).putData(data, metadata: metadata, completion: { (metadata, error) in
                if let error = error {
                    print("\(error.description)")
                    return
                }
                
                self.fileUrl = metadata?.downloadURLs![0].absoluteString
                let changeRequestPhoto = user!.profileChangeRequest()
                changeRequestPhoto.photoURL = NSURL(string: self.fileUrl)
                changeRequestPhoto.commitChangesWithCompletion({ (error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }else {
                        print("profile updated") 
                    }
                })
                
                ProgressHUD.showSuccess("Succeeded.")
                let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.login()
            })
        })
        
        
    }
}