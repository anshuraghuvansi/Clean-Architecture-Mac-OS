//
//  UserAuthorizationUseCase.swift
//  NetworkKit
//
//  Created by Anshu Raghuvansi on 01/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import RxSwift
import DomainKit

final class UserAuthorizationUseCase:DomainKit.UserAuthorizationUseCase{
    
    private let network:AuthorizationNetwork
    
    init(network:AuthorizationNetwork) {
        self.network = network
    }
    
    func signup(params: SignupBodyParams) -> Observable<Authorization> {
        return network.signup(params: params.toJSON())
    }
    
    func signin(params: SigninBodyParams) -> Observable<Authorization> {
        return network.signin(params: params.toJSON())
    }
}
