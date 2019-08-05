//
//  UseCaseProvider.swift
//  NetworkKit
//
//  Created by Anshu Raghuvansi on 01/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import DomainKit

public final class UseCaseProvider:DomainKit.UseCaseProvider{
    
    let networkProvider = NetworkProvider()
    public init(){}
    
    public func makeUserProfileUseCase() -> DomainKit.UserProfileUseCase {
        let network = networkProvider.makeProfileNetwork()
        return UserProfileUseCase(network: network)
    }
    
    public func makeUserAuthorizationUseCase() -> DomainKit.UserAuthorizationUseCase {
        let network = networkProvider.makeAuthorizationNetwork()
        return UserAuthorizationUseCase(network:network)
    }
}
