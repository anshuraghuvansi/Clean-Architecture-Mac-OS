//
//  UserAuthorization.swift
//  Domain
//
//  Created by Anshu Raghuvansi on 21/07/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import RxSwift

public protocol UserAuthorizationUseCase {
    func signup(params:SignupBodyParams) -> Observable<Authorization>
    func signin(params:SigninBodyParams) -> Observable<Authorization>
}
