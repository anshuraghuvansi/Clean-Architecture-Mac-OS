//
//  SignupViewModel.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 05/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import DomainKit

final class SignupViewModel:ViewModelProtocol{
    
    var input: SignupViewModel.Input!
    var output: SignupViewModel.Output!
    
    let navigator:SignupNavigator
    private let bag = DisposeBag()
    
    init(navigator:SignupNavigator) {
        self.navigator = navigator
        output = Output()
        handleInput()
    }
    
    func signup(){
        
        let params = SignupBodyParams(name:input.name.value,
                                      email: input.email.value,
                                      password: input.password.value)
        
        let err = params.validate()
        output.error.accept(err)
        if err != nil{ return }
        
        navigator.useCaseProvider
            .makeUserAuthorizationUseCase()
            .signup(params: params)
            .subscribe(onNext: {[weak self](auth) in
                guard let self = self else { return }
                Application.shared.authorization.accept(auth)
                self.navigator.dismiss()
            },onError: { [weak self](error) in
                    self?.output.error.accept(error)
            }).disposed(by: bag)
    }
}

extension SignupViewModel {
    
    struct Input {
        let signupTap = PublishRelay<Void>()
        let closeTap = PublishRelay<Void>()
        let name = BehaviorRelay<String?>(value: nil)
        let email = BehaviorRelay<String?>(value: nil)
        let password = BehaviorRelay<String?>(value: nil)
    }
    
    struct Output {
        let error = PublishRelay<Error?>()
    }
    
    func handleInput() {
        
        input = Input()
        
        input.signupTap.subscribe(onNext: { [weak self] _  in
            self?.signup()
        }).disposed(by: bag)

        input.closeTap.subscribe(onNext: { [weak self] _  in
            self?.navigator.dismiss()
        }).disposed(by: bag)
    }
}
