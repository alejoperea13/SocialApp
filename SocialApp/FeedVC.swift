//
//  FeedVC.swift
//  SocialApp
//
//  Created by Alejandro perea on 1/8/17.
//  Copyright © 2017 alperi. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        UIApplication.shared.statusBarStyle = .default
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signInTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("ALEJANDRO: ID removed from keychain \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
  
    

 
}
