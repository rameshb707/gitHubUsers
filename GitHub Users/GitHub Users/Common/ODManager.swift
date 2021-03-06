//
//  ODManager.swift
//  GitHub Users
//
//  Created by Ramesh B on 22/08/20.
//  Copyright © 2020 Ramesh B. All rights reserved.
//

import Foundation

class ODManager {
    
    /// Shared reference of the singleton object
    static let sharedInstance = ODManager()
    
    /// Base URL for which the API has to hit
    var baseURL: String = ""
    
    let defaults = UserDefaults.standard
    
    /// Private initializer so that no one can create another instance of ODManager
    private init() {
        initWithHost()
    }
    
    /**
        Fetches the host url from the info.plist file
     */
    func initWithHost() {
        var api: [String:String] = [:]
        if let apiInConfig = Bundle.main.object(forInfoDictionaryKey: "Base URL API") as? [String:String] {
            api = apiInConfig
        }
        for (key,val) in api {
            if key == "host" {
                baseURL = val
            }
        }
    }
    
    func saveInUserDefault(_ isfavorite: Bool, key forUser: String) {
        defaults.set(isfavorite, forKey: forUser)
    }
    
    func fetchFromUserDefaults(key forUser: String) -> Bool {
        return defaults.bool(forKey: forUser)
    }
}
