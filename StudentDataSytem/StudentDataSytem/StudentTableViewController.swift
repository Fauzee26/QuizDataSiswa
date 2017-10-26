//
//  StudentTableViewController.swift
//  StudentDataSytem
//
//  Created by Muhammad Hilmy Fauzi on 26/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
var name1 = ""
var email1 = ""
var school1 = ""
var myIndex = 0
class StudentTableViewController: UITableViewController {
    
    var tasks: [DataSiswa] = []
    
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
        if let myData1 = dataTask.ds_username {
            //display data to label
            cell.labelName.text = myData1
        }
        if let myData1 = dataTask.ds_email {
            //display data to label
            cell.labelEmail.text = myData1
        }
        if let myData3 = dataTask.ds_school {
            //display data to label
            cell.labelSchool.text = myData3
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataTask = tasks[indexPath.row]
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "segue", for: indexPath) as! DataProfileViewController
        //put data eith attributs name_task
        _ = dataTask.ds_username
        //display data to label
        cell1.lblUsername.text! = name1
        _ = dataTask.ds_school
        cell1.lblEmail.text! = email1
        _ = dataTask.ds_email
        cell1.lblSchool.text! = school1
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


