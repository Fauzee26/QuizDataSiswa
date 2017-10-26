//
//  DataProfileViewController.swift
//  StudentDataSytem
//
//  Created by Muhammad Hilmy Fauzi on 26/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class DataProfileViewController: UIViewController {
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblSchool: UILabel!
    @IBOutlet weak var lblClass: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    var passNama:String?
    var passEmail:String?
    var passPassword:String?
    var passSchool:String?
    var passClass:String?
    var passAge:String?
    override func viewDidLoad() {
        lblUsername.text = "Your Username: " + passNama!
        lblEmail.text = "Your Email: " + passEmail!
        lblPassword.text = "Your Password: " + passPassword!
        lblSchool.text = "Your School: " + passSchool!
        lblClass.text = "Your Class: " + passClass!
        lblAge.text = "Your Age: " + passAge!
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
