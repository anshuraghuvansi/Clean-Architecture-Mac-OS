//
//  Authorization.swift
//  Domain
//
//  Created by Anshu Raghuvansi on 22/07/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

public struct Authorization:Codable {
    
    public var token:String
    
    public init(token:String) {
        self.token = token
    }
    
    public var isValid:Bool{
        return !token.isEmpty
    }
}
