//
//  NetworkProvider.swift
//  Network
//
//  Created by Anshu Raghuvansi on 22/07/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import DomainKit

final class NetworkProvider {
    
    func makeProfileNetwork() -> ProfileNetwork {
        let network = Network(Environment.current.authorizationUrl)
        return ProfileNetwork(network: network)
    }
    
    func makeAuthorizationNetwork() -> AuthorizationNetwork {
        let network = Network(Environment.current.authorizationUrl)
        return AuthorizationNetwork(network: network)
    }
}
