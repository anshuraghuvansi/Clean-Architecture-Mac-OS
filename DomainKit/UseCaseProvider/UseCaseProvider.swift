//
//  UseCaseProvider.swift
//  Domain
//
//  Created by Anshu Raghuvansi on 21/07/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

public protocol UseCaseProvider {
    func makeUserProfileUseCase() -> UserProfileUseCase
    func makeUserAuthorizationUseCase() -> UserAuthorizationUseCase
}
