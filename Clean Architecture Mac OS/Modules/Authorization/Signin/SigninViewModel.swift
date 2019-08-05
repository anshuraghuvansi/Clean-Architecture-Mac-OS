//
//  SigninViewModel.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 05/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import DomainKit

final class SigninViewModel:ViewModelProtocol{
    
    var input: SigninViewModel.Input!
    var output: SigninViewModel.Output!
    private let bag = DisposeBag()
    
    let navigator:SigninNavigator
    init(navigator:SigninNavigator) {
        self.navigator = navigator
        output = Output()
        handleInput()
    }
    
    func signin(){
        
        let params = SigninBodyParams(email: input.email.value,
                                      password: input.password.value)
        
        let err = params.validate()
        output.error.accept(err)
        if err != nil{ return }
        
        navigator.useCaseProvider
            .makeUserAuthorizationUseCase()
            .signin(params: params)
            .subscribe(onNext: {[weak self](auth) in
                guard let self = self else { return }
                Application.shared.authorization.accept(auth)
                self.navigator.dismiss()
            },onError: { [weak self](error) in
                    self?.output.error.accept(error)
            }).disposed(by: bag)
    }
}

extension SigninViewModel {
    
    struct Input {
        let signinTap = PublishRelay<Void>()
        let closeTap = PublishRelay<Void>()
        let email = BehaviorRelay<String?>(value: nil)
        let password = BehaviorRelay<String?>(value: nil)
    }
    
    struct Output {
        let error = PublishRelay<Error?>()
    }
    
    func handleInput() {
        input = Input()
        
        input.signinTap.subscribe(onNext: { [weak self]_ in
            self?.signin()
        }).disposed(by: bag)
        
        input.closeTap.subscribe(onNext: { [weak self] in
            self?.navigator.dismiss()
        }).disposed(by: bag)
    }
}
