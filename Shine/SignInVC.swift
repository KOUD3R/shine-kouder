//
//  SignInVC.swift
//  Shine
//
//  Created by Kiddos on 9/29/16.
//  Copyright © 2016 Kiddos. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailAddressTextField: MaterialTextField!
    @IBOutlet weak var passwordTextField: MaterialTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.stringForKey(KEY_UID) {
            performSegue(withIdentifier: "goToHome", sender: nil)
        }
    }
    
    @IBAction func facebookLoginTapped(_ sender: AnyObject) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (user, error) in
            if error != nil {
                ProgressHUD.showError("Oops, \(error?.localizedDescription)")
            } else if user?.isCancelled == true {
                ProgressHUD.showSuccess("Facebook Login Cancelled")
            } else {
                ProgressHUD.showSuccess("Login into Facebook complete")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                ProgressHUD.showError("Oops, \(error?.localizedDescription)")
            } else {
                ProgressHUD.showSuccess("Connected to server")
                if let user = user {
                    self.completeSignIn(id: user.uid)
                }
            }
        })
    }
    
    @IBAction func loginTapped(_ sender: AnyObject) {
        
        if let email = emailAddressTextField.text, let password = passwordTextField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    ProgressHUD.showSuccess("Let's go!")
                    if let user = user {
                        self.completeSignIn(id: user.uid)
                    }
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            ProgressHUD.showError("Oops, \(error?.localizedDescription)")
                        } else {
                            ProgressHUD.showSuccess("Sign up successful!")
                            if let user = user {
                                self.completeSignIn(id: user.uid)
                            }
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String) {
        let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        print("KOU: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToHome", sender: nil)
    }
}
