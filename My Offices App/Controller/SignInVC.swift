//
//  ViewController.swift
//  My Offices App
//
//  Created by Mert Köksal on 23.07.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            print("id found in keychain")
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }

    @IBAction func facebookButtonTapped(_ sender: Any) {
        
        let fbLoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                       print("Failed to login: \(error.localizedDescription)")
                       return
                   }
                   
                guard let accessToken = AccessToken.current else {
                       print("Failed to get access token")
                       return
                   }
            
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
                   
                self.firebaseAuth(credential)
            
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error ) in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                if let userID = Auth.auth().currentUser?.uid {
                    let userData = ["provider": credential.provider]
                    self.completeSignIn(id: userID, userData: userData)
                }
            })
        }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) {
                (user,error) in
                if error == nil {
                    print("Able to auth with firebase email")
                    if let userID = Auth.auth().currentUser?.uid {
                        let userData = ["provider":Auth.auth().currentUser?.providerID] as! Dictionary <String,String>
                        self.completeSignIn(id: userID, userData: userData)
                    }
                } else {
                    Auth.auth().createUser(withEmail:email, password: password) { (user,error) in
                        if error != nil {
                            print("Unable to auth with firebase")
                        } else {
                            print("Successfully auth with firebase email")
                            if let userID = Auth.auth().currentUser?.uid {
                                let userData = ["provider": Auth.auth().currentUser?.providerID] as! Dictionary <String,String>
                                self.completeSignIn(id: userID, userData: userData)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func completeSignIn(id: String, userData: Dictionary<String,String>) {
        DataService.ds.createFirebaseDatabaseUser(uid: id, userData: userData)
        let keyChainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("Data saved to keychain \(keyChainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
    
}

