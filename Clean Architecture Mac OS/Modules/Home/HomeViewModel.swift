//
//  HomeViewModel.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 04/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class HomeViewModel:ViewModelOutputProtocol {
    
    private let bag = DisposeBag()
    var output: HomeViewModel.Output!
    
    let navigator:HomeNavigator
    init(navigator:HomeNavigator) {
        self.navigator = navigator
        output = Output()
    }
    
    func fetchProfile(){
        
    navigator.useCaseProvider
        .makeUserProfileUseCase()
        .fetchProfile()
        .subscribe(onNext: {[weak self](profile) in
            
            guard let self = self else { return }
            self.output.email.accept(profile.email)
            self.output.name.accept(profile.name)
                Application.shared.userProfile.accept(profile)
            
            }, onError: { [weak self](error) in
                self?.output.error.accept(error)
        }).disposed(by: bag)
    }
}

extension HomeViewModel {
    
    struct Output {
        let error = PublishRelay<Error?>()
        let email = BehaviorRelay<String?>(value: nil)
        let name = BehaviorRelay<String?>(value: nil)
    }
}
