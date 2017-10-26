//
//  InputProfileViewController.swift
//  StudentDataSytem
//
//  Created by Muhammad Hilmy Fauzi on 26/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class InputProfileViewController: UIViewController {

    @IBOutlet weak var etUsername: UITextField!
    @IBOutlet weak var etEmail: UITextField!
    @IBOutlet weak var etPassword: UITextField!
    @IBOutlet weak var etSchool: UITextField!
    @IBOutlet weak var etClass: UITextField!
    @IBOutlet weak var etAge: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //check what segue with name passData is available or not
        if(segue.identifier == "passData"){
            //declare sendData as destination segue with name view controller : GetDataViewController
            let sendData = segue.destination as! DataProfileViewController
            
            //put the data that we want to send
            //send username data
            sendData.username = etUsername.text!
            sendData.email = etEmail.text!
            sendData.password = etPassword.text!
            sendData.school = etSchool.text!
            sendData.classs = etClass.text!
            sendData.age = etAge.text!
            
        }
    }
    @IBAction func btnSave(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let nameTask = DataSiswa(context: context)
        
        nameTask.ds_username = etUsername.text
        nameTask.ds_school = etSchool.text
        nameTask.ds_password = etPassword.text
        nameTask.ds_email = etEmail.text
        nameTask.ds_class = etClass.text
        nameTask.ds_age = etAge.text
        
        if etUsername.text! == "" && etSchool.text! == "" && etPassword.text! == "" {
            //condition if nil
            //display alert dialog
            let alertController = UIAlertController(title: "Warning",
                                                    message: "Phone Profile Can't Be Empty", preferredStyle : .alert)
            alertController.addAction(UIAlertAction(title: "OK",
                                                    style: .default,handler: nil))
            present(alertController, animated: true, completion: nil)
        }else{
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            _ = navigationController?.popViewController(animated: true)
            
            //print if the data has been added
            print("Data has been added")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
