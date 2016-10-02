//
//  ProfileVC.swift
//  Shine
//
//  Created by Kiddos on 10/1/16.
//  Copyright © 2016 Kiddos. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIApplication.shared.isStatusBarHidden = false
    }
    
    @IBAction func signOut(_ sender: AnyObject) {
        
        let keychainResult = KeychainWrapper.removeObjectForKey(KEY_UID)
        print("KOU: removed from keychain \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "profileToSignin", sender: nil)
    }
}
