//
//  UserDefaults.swift
//  Common
//
//  Created by Anshu Raghuvansi on 02/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

public extension UserDefaults{
    
    static var AuthToken:String?{
        get{
            return UserDefaults.standard.string(forKey: "AuthToken")
        }
        set{
            UserDefaults.standard.setValue(newValue, forKeyPath: "AuthToken")
        }
    }
}
