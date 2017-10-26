//
//  LaunchSViewController.swift
//  QuizDataSiswa
//
//  Created by DOTS2 on 10/26/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class LaunchSViewController: UIViewController {

    override func viewDidLoad() {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named:  "a0e2f3d1e3483bc5acb56869d5ca8a9c_w324_h576_sc.jpg")
        self.view.insertSubview(backgroundImage, at: 0)
        
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
