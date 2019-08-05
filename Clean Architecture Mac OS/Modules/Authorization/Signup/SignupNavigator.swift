//
//  SignupNavigator.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 05/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import Common

final class SignupNavigator:BaseNavigator{
    
    func toSignupScreen(){
        let vc:SignupViewController = storyBoard.instantiateViewController()
        vc.viewModel = SignupViewModel(navigator: self)
        rootController.present(vc, animator: SlideUpAnimator())
    }
}
