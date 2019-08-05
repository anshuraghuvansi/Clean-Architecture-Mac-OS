//
//  UserProfileUseCase.swift
//  Domain
//
//  Created by Anshu Raghuvansi on 02/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import RxSwift

public protocol UserProfileUseCase{
    func fetchProfile() -> Observable<UserProfile>
}
