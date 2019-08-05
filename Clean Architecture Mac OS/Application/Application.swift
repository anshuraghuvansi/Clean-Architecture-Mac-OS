//
//  Application.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 04/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Cocoa
import Common
import RxCocoa
import RxSwift
import NetworkKit
import DomainKit

final class Application {

    static let shared = Application()
    let mainWindowController:MainWindowController
    var rootController:NSViewController{
        return mainWindowController.contentViewController!
    }
    
    let userProfile = BehaviorRelay<UserProfile?>(value: nil)
    let authorization = BehaviorRelay<Authorization?>(value: nil)
    
    var networkProvider = NetworkKit.UseCaseProvider()
    private let bag = DisposeBag()
    
    private init(){
        //set main window controller as entry point for the
        //application
        let storyboard = NSStoryboard.board(named: "Main")
        self.mainWindowController = storyboard.instantiateWindowController()
        
        let homeNavigator = HomeNavigator(storyBoard: storyboard,
                                          useCaseProvider: networkProvider)
        homeNavigator.setHomeScreen(to: mainWindowController)
    }

    func start(){
        
        //get saved token
        if let token = UserDefaults.AuthToken{
            authorization.accept(Authorization(token:token))
        }
        
        authorization.subscribe(onNext: { (auth) in
            Network.token = auth?.token
            UserDefaults.AuthToken = auth?.token //save token
        }).disposed(by: bag)
        
        //present main window
        mainWindowController.showWindow(self)
        
        //show splash screen
        showSplashScreen()
        
        mainWindowController
            .signinButton.rx.tap
            .subscribe(onNext: { [weak self] in
            self?.showSigninScreen()
        }).disposed(by: bag)
        
        mainWindowController
            .signupButton.rx.tap
            .subscribe(onNext: { [weak self] in
            self?.showSignupScreen()
        }).disposed(by: bag)
    }
}

extension Application {
    
    func showSplashScreen(){
        let storyboard = NSStoryboard.board(named: "Main")
        let navigator = SplashNavigator(rootController: rootController,
                                        storyBoard: storyboard,
                                        useCaseProvider: networkProvider)
        navigator.toSplashScreen()
    }
    
    func showSigninScreen(){
        let storyboard = NSStoryboard.board(named: "Authorization")
        let navigator = SigninNavigator(rootController: rootController,
                                        storyBoard: storyboard,
                                        useCaseProvider: networkProvider)
        navigator.toSigninScreen()
    }
    
    func showSignupScreen(){
        let storyboard = NSStoryboard.board(named: "Authorization")
        let navigator = SignupNavigator(rootController: rootController,
                                        storyBoard: storyboard,
                                        useCaseProvider: networkProvider)
        navigator.toSignupScreen()
    }
}
