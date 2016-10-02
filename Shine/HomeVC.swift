//
//  FirstViewController.swift
//  Shine
//
//  Created by Kiddos on 9/29/16.
//  Copyright © 2016 Kiddos. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.shared.statusBarStyle = .default
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            print(snapshot.value)
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIApplication.shared.isStatusBarHidden = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
        
    }
}

