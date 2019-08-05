//
//  AppError.swift
//  Common
//
//  Created by Anshu Raghuvansi on 22/07/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

public struct Failure:LocalizedError {
    
    public let code:Int
    public let message:String
    
    public var failureReason: String?{
        return message
    }
    
    public var errorDescription: String?{
        return message
    }
    
    public init(message:String,code:Int = 0) {
        self.code = code
        self.message = message.localized()
    }
}
