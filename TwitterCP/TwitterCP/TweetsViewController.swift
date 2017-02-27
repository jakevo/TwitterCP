//
//  TweetsViewController.swift
//  TwitterCP
//
//  Created by Jake Vo on 2/26/17.
//  Copyright © 2017 Jake Vo. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func onLogout(_ sender: Any) {
        
        TwitterClient.sharedInstance?.logout()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if User.currentUser != nil {
            print("something is wrong")
        }
        // Do any additional setup after loading the view.
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
