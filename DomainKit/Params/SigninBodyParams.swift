//
//  SigninBodyParams.swift
//  Domain
//
//  Created by Anshu Raghuvansi on 22/07/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import Common

public struct SigninBodyParams:JSONConvertable,Validatable  {
    
    public var email:String?
    public var password:String?
    
    public init(email:String?,password:String?){
        self.email = email
        self.password = password
    }
    
    public func toJSON() -> [String : Any] {
        
        guard let email = self.email,
            let password = self.password else {
                return [:]
        }
        
        return[
            "email":email,
            "password":password
        ]
    }
    
    public func validate() -> Error? {
        
        //Here I am not doing complete validation check
        //only checking if value is empty
        guard let email = self.email,!email.isEmpty else {
            return Failure(message:"valid_email")
        }
        
        guard let password = self.password,!password.isEmpty else {
            return Failure(message:"valid_password")
        }
        return nil
    }
}
