//
//  ItemDetailsVC.swift
//  My Offices App
//
//  Created by Mert Köksal on 24.07.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController {

    @IBOutlet weak var officeNameField: UITextField!
    @IBOutlet weak var officePhoneField: UITextField!
    @IBOutlet weak var officeEmailField: UITextField!
    @IBOutlet weak var officeAddressField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
}
