//
//  SigninNavigator.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 05/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import Common

final class SigninNavigator:BaseNavigator{
    
    func toSigninScreen(){
        let vc:SigninViewController = storyBoard.instantiateViewController()
        vc.viewModel = SigninViewModel(navigator: self)
        rootController.present(vc, animator: SlideUpAnimator())
    }
}
