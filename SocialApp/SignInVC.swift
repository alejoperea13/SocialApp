//
//  ViewController.swift
//  SocialApp
//
//  Created by Alejandro perea on 1/5/17.
//  Copyright © 2017 alperi. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    

    override func viewDidLoad() {
        UIApplication.shared.statusBarStyle = .lightContent
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
     UIApplication.shared.statusBarStyle = .default
    let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil{
                print("ALEJANDRO: Unable to authenticate with Facebook \(error)")
            } else if result?.isCancelled == true {
                print("ALEJANDRO: User cancelled Authetication")
            } else {
                print("ALEJANDRO: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential){
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("ALEJANDRO: Unable to authenticate with Firebase")
            } else {
                print("ALEJANDRO: Successfully authentiate with Firebase")
            }
        })
        
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text, let pwd = pwdField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("ALEJANDRO: Email user authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                              print("ALEJANDRO: Unable to authenticate with Firebase using email \(error)")
                        } else {
                            print("ALEJANDRO: Successfully authenticated with Firebase")
                        }
                    })
                  
                }
            })
        }
    }

}

