//
//  TweetsViewController.swift
//  TwitterCP
//
//  Created by Jake Vo on 2/26/17.
//  Copyright © 2017 Jake Vo. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var tweetsArray: [Tweet]!
    @IBAction func onLogout(_ sender: Any) {
        
        TwitterClient.sharedInstance?.logout()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let client = TwitterClient.sharedInstance!
                
        client.homeTimeline(success: { (tweets: [Tweet]) in
                print (tweets)
        }) { (error:NSError) in
            print(error.localizedDescription)
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return tweetsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TweetCell
        cell.tweet = tweetsArray[indexPath.row]
        return cell
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
