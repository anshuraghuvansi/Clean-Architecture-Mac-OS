//
//  SplashNavigator.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 04/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import Common

final class SplashNavigator:BaseNavigator{
    
    func toSplashScreen(){
        
        let vc:SplashViewController = storyBoard.instantiateViewController()
        vc.viewModel = SplashViewModel(navigator: self)
        rootController.present(vc, animator: FadeAnimator())
    }
}
