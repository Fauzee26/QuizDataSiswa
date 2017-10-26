//
//  InputProfileViewController.swift
//  StudentDataSytem
//
//  Created by Muhammad Hilmy Fauzi on 26/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class IsiViewController: UIViewController {
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var labelSchool: UILabel!
    @IBOutlet weak var labelClass: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    //
    var passNama:String?
    var passEmail:String?
    var passPassword:String?
    var passSchool:String?
    var passClass:String?
    var passAge:String?
    override func viewDidLoad() {
        
        
        labelUsername.text = "Your Username is " + passNama!
        labelEmail.text = "Your Email is " + passEmail!
        labelPassword.text = "Your Password is " + passPassword!
        labelSchool.text = "Your School is " + passSchool!
        labelClass.text = "Your Class is " + passClass!
        labelAge.text = "Your Age is " + passAge! + " Years Old"
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
