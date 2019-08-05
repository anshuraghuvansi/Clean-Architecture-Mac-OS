//
//  Environment.swift
//  Network
//
//  Created by Anshu Raghuvansi on 22/07/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

enum Environment {
    
    case production
    case development
    
    struct Urls {
        static let AuthorizationDev     = "http://192.168.0.39:8080/api/v1"
        static let AuthorizationProd    = "https://"
    }
    
    enum Service{
        
        case Authorization
        
        var url:String{
            return Environment.isProduction ? Urls.AuthorizationProd : Urls.AuthorizationDev
        }
    }
    
    static var isProduction:Bool{
        return self.current == .production
    }
    
    var authorizationUrl:String{
        return Service.Authorization.url
    }
    
    static var current:Environment{
        return .development
    }
}

