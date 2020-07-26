//
//  RegisterVC.swift
//  My Offices App
//
//  Created by Mert Köksal on 25.07.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userSurnameField: UITextField!
    @IBOutlet weak var userMobileField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func updateUser() {
    
        let name = userNameField.text
        let surname = userSurnameField.text
        let cellphone = userMobileField.text
        let userID = (Auth.auth().currentUser?.uid)!
        
        
        let userInfo: Dictionary<String,Any> = ["cellphone": cellphone, "surname": surname , "name": name]
        
        let firebasePost = DataService.ds.REF_USERS.child(userID)
        firebasePost.setValue(userInfo)
        
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        updateUser()
        
    }
    

}
