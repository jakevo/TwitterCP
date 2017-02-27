//
//  User.swift
//  TwitterCP
//
//  Created by Jake Vo on 2/25/17.
//  Copyright © 2017 Jake Vo. All rights reserved.
//

import UIKit

class User: NSObject {

    var name: NSString?
    var screenname: NSString?
    var profileURL: NSURL?
    var tagline: NSString?
    
    var dictionaryObj: NSDictionary?
    
    init(dictionary: NSDictionary) {
        
        self.dictionaryObj = dictionary
        self.name = dictionary["name"] as? NSString
        self.screenname = dictionary["name"] as? NSString
        
        if let profileURLString = dictionary["profile_image_url_htpps"] as? String {
            self.profileURL = NSURL(string: profileURLString)
        }
        
        self.tagline = dictionary["description"] as? NSString
    }
    
    static var _currentUser: User?
    static let userDidLogout = "UserDidLogout"
    
    class var currentUser: User? {
        get {
            let defaults = UserDefaults.standard
            
            if _currentUser == nil {
                
                
                let userData = defaults.object(forKey: "currentUser") as? Data
                
                if let userData = userData {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
                
            }
            return _currentUser
        }
        
        set(user) {
            
            _currentUser = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionaryObj!, options: [])
                defaults.set(data, forKey: "currentUser")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
            defaults.synchronize()
        }
    }
    
    
    
}
