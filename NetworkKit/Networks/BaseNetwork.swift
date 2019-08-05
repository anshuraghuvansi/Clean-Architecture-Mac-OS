//
//  BaseNetwork.swift
//  NetworkKit
//
//  Created by Anshu Raghuvansi on 01/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import RxSwift

class BaseNetwork {
    
    let network: Network
    
    init(network: Network){
        self.network = network
    }
}

