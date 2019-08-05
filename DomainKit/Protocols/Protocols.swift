//
//  Protocols.swift
//  Domain
//
//  Created by Anshu Raghuvansi on 22/07/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

public protocol JSONConvertable {
    func toJSON() -> [String:Any]
}

public protocol Validatable {
    func validate() -> Error?
}
