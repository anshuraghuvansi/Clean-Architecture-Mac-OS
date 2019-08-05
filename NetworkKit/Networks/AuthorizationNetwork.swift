//
//  AuthorizationNetwork.swift
//  NetworkKit
//
//  Created by Anshu Raghuvansi on 01/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import RxSwift
import DomainKit

class AuthorizationNetwork: BaseNetwork {
    
    func signup(params: [String:Any]) -> Observable<Authorization> {
        return network.post("user/signup", parameters: params)
    }
    
    func signin(params: [String:Any]) -> Observable<Authorization> {
        return network.post("user/signin", parameters: params)
    }
}
