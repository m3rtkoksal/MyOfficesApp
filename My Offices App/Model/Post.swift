//
//  Post.swift
//  My Offices App
//
//  Created by Mert Köksal on 24.07.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import Foundation
import Firebase

class Post {
    
    private var _officeName: String!
    private var _officePhone: String!
    private var _officeEmail: String!
    private var _officeAddress: String!
    private var _postID: String!
    private var _postRef: DatabaseReference!
    
    var officeName: String {
        return _officeName
    }
    
    var officePhone: String {
        return _officePhone
    }
    
    var officeEmail: String {
        return _officeEmail
    }
    
    var officeAddress: String {
        return _officeAddress
    }
    
    init(officeName: String, officePhone: String, officeEmail: String, officeAddress: String) {
        self._officeName = officeName
        self._officePhone = officePhone
        self._officeEmail = officeEmail
        self._officeAddress = officeAddress
    }
    
    init(postID: String, postData: Dictionary<String,AnyObject>) {
        self._postID = postID
        
        if let officeName = postData["name"] as? String {
            self._officeName = officeName
        }
        
        if let officePhone = postData["phone"] as? String {
            self._officePhone = officePhone
        }
        
        if let officeEmail = postData["email"] as? String {
            self._officeEmail = officeEmail
        }
        
        if let officeAddress = postData["address"] as? String {
            self._officeAddress = officeAddress
        }
        
        _postRef = DataService.ds.REF_POSTS.child(_postID)
        
    }
    
    
    
    
}
