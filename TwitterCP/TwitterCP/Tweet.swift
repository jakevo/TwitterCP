//
//  Tweet.swift
//  TwitterCP
//
//  Created by Jake Vo on 2/25/17.
//  Copyright © 2017 Jake Vo. All rights reserved.
//

import UIKit



class Tweet: NSObject {

    
    var text: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? NSString
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        
        favoritesCount = (dictionary["favorite_count"] as? Int) ?? 0
        
        if let timestampString = dictionary["created at"] as? String {
            //date parser to get correct date format
            let formatter = DateFormatter()
            
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y "
            
            timestamp = formatter.date(from: timestampString) as NSDate?
        }
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary])  -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        return tweets
    }
}
