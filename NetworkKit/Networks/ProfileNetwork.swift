//
//  ProfileNetwork.swift
//  NetworkKit
//
//  Created by Anshu Raghuvansi on 02/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import RxSwift
import DomainKit

final class ProfileNetwork:BaseNetwork{
   
    func fetchProfile() -> Observable<UserProfile> {
        return network.get("user/profile")
    }
}
