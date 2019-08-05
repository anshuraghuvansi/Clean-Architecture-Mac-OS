//
//  Success.swift
//  Common
//
//  Created by Anshu Raghuvansi on 22/07/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

public struct Success:Decodable{
    
    public var status:Int
    public var message:String
    
    public init(status:Int,message:String) {
        self.status = status
        self.message = message
    }
}
