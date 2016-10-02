//
//  SecondViewController.swift
//  Shine
//
//  Created by Kiddos on 9/29/16.
//  Copyright © 2016 Kiddos. All rights reserved.
//

import UIKit

class CameraVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

