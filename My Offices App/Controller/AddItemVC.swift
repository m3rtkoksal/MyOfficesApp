//
//  ItemDetailsVC.swift
//  My Offices App
//
//  Created by Mert Köksal on 24.07.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {

    @IBOutlet weak var officeNameField: UITextField!
    @IBOutlet weak var officePhoneField: UITextField!
    @IBOutlet weak var officeEmailField: UITextField!
    @IBOutlet weak var officeAddressField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func postToFirebase() {
        
        let post: Dictionary<String,Any> = ["address": officeAddressField.text!, "email": officeEmailField.text , "name": officeNameField.text, "phone": String(officePhoneField.text!)]
        
        let firebasePost = DataService.ds.REF_POSTS.childByAutoId()
        firebasePost.setValue(post)
        
        officeNameField.text = ""
        officePhoneField.text = ""
        officeEmailField.text = ""
        officeAddressField.text = ""
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        
        postToFirebase()
        
    }
    
}
