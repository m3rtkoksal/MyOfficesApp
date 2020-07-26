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

        DataService.ds.REF_USER_CURRENT
    }
    func post() {
        let name = userNameField.text
        let surname = userSurnameField.text
        let cellphone = userMobileField.text
        
        if let userID = Auth.auth().currentUser?.uid {
            let userData = ["name": Auth.auth().currentUser?.providerID] as! Dictionary <String,String>
        }
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    

}
