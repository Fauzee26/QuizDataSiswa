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

   
    @IBAction func btnSave(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let nameTask = DataSiswa(context: context)
        
        nameTask.ds_username = etUsername.text
        nameTask.ds_school = etSchool.text
        nameTask.ds_password = etPassword.text
        nameTask.ds_email = etEmail.text
        nameTask.ds_class = etClass.text
        nameTask.ds_age = etAge.text
        
        if etUsername.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etEmail.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etPassword.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etClass.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etSchool.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etAge.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            //ketika kondisi tesk task nya tidak kosong
            //data di simpan ke core Data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            _ = navigationController?.popViewController(animated: true)
            
            //mencetak kalau data berhasil ditambahkan
            print("Data berhasil disimpan")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
