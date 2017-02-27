//
//  TweetCell.swift
//  TwitterCP
//
//  Created by Jake Vo on 2/26/17.
//  Copyright © 2017 Jake Vo. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var currentName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var retweetTop: UIImageView!
    @IBOutlet weak var whoRetweet: UILabel!
    
    var tweet: Tweet! {
        
        didSet {
            self.avatar.setImageWith(tweet.profileImage!)
            self.name.text = tweet.usertweet as String?
            //self.time.text = String (describing: tweet.timestamp)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
