//
//  SplashViewModel.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 04/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

final class SplashViewModel {
    
    let navigator:SplashNavigator
    
    init(navigator:SplashNavigator) {
        
        self.navigator = navigator
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.0) {
            self.navigator.dismiss()
        }
    }
}
