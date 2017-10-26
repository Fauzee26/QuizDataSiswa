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
    
    var username = ""
    var password = ""
    var email = ""
    var school = ""
    var classs = ""
    var age = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblUsername.text = "Your Username: " + username
        lblEmail.text = "Your Email: " + email
        lblPassword.text = "Your Password: " + password
        lblSchool.text = "Your School: " + school
        lblClass.text = "Your Class: " + classs
        lblAge.text = "Your Age: " + age

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
