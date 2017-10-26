//
//  StudentTableViewController.swift
//  StudentDataSytem
//
//  Created by Muhammad Hilmy Fauzi on 26/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class DataSiswaTableViewController: UITableViewController {
    var datas : [DataSiswa] = [] //Task ini di panggil dari entiti yang sudah di buat sebelumnya
    //dekarasikan context object untuk persistnet container
    var namaSelected:String?
    var emailSelected:String?
    var passwordSelected:String?
    var schoolSelected:String?
    var classSelected:String?
    var ageSelected:String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return datas.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellData", for: indexPath) as! DataTableViewCell
        
        // Configure the cell...
        // Configure the cell...
        
        //deklarasi dataTask sebagai Index dari tasks
        let dataTask = datas[indexPath.row]
        //mengambildata dengan attribute name_Task
        if let myDataTask = dataTask.ds_username {
            //menampilkan data ke label
            cell.labeluser.text = myDataTask
        }
        if let myDataTask1 = dataTask.ds_email {
            cell.labelemail.text = myDataTask1
        }
        if let myDataTask2 = dataTask.ds_school{
            cell.labelgmail.text = myDataTask2
        }
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method getData
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //mengecek apakah ada error atau tidak
        do{
            //kondisi kalau tidak ada error
            //maka akan request download data
            datas = try context.fetch(DataSiswa.fetchRequest())
        }
        catch{
            //kondisi apabila error fetch data
            print("Fetching Failed")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //mengece menu swipe bila edit data
        if editingStyle == .delete {
            let task = datas[indexPath.row]
            context.delete(task)
            //Delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                //retrieve data
                datas = try context.fetch(DataSiswa.fetchRequest())
            }
            catch{
                print("Fetching Failed")
            }
        }
        //load data lagi
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let dataTask = datas[indexPath.row]
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
            let kirimData = segue.destination as! IsiViewController
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
