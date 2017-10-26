//
//  StudentTableViewController.swift
//  StudentDataSytem
//
//  Created by Muhammad Hilmy Fauzi on 26/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {
    
    var tasks: [DataSiswa] = []
    var namaSelected:String?
    var emailSelected:String?
    var passwordSelected:String?
    var schoolSelected:String?
    var classSelected:String?
    var ageSelected:String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 650.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! ListTableViewCell
        
        let dataTask = tasks[indexPath.row]
        //put data eith attributs name_task
        if let myDataTask1 = dataTask.ds_username {
            //display data to label
            cell.labelName.text = myDataTask1
        }
        if let myDataTask2 = dataTask.ds_email {
            //display data to label
            cell.labelEmail.text = myDataTask2
        }
        if let myDataTask3 = dataTask.ds_school {
            //display data to label
            cell.labelSchool.text = myDataTask3
        }
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let dataTask = tasks[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        namaSelected = dataTask.ds_username
        emailSelected = dataTask.ds_email
        passwordSelected = dataTask.ds_password
        schoolSelected = dataTask.ds_school
        classSelected = dataTask.ds_class
        ageSelected = dataTask.ds_age
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "passData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "passData"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let kirimData = segue.destination as! DataProfileViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            kirimData.passNama = namaSelected
            //mengirimkan data gambar wisata
            kirimData.passEmail = emailSelected
            kirimData.passPassword = passwordSelected
            kirimData.passSchool = schoolSelected
            kirimData.passClass = classSelected
            kirimData.passAge = ageSelected
            
            
            
            
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        //call method getData()
        getData()
        //call reloadData
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //check what there is error or not
        do {
            //condition if nothing error
            //so will request download data
            tasks = try context.fetch(DataSiswa.fetchRequest())
        }catch{
            //condition if error fatch data
            print("Fetching Failed")
        }
    }
    
    //add data to delete data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //check swipe menu if the editing style is delete
            let task = tasks[indexPath.row]
            context.delete(task)
            //delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                //retrieve data
                tasks = try context.fetch(DataSiswa.fetchRequest())
            } catch {
                print("Fetching Failed")
            }
        }
        //load data again
        tableView.reloadData()
    }
}


