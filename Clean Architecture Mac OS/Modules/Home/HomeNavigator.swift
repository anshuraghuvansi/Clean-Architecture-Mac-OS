//
//  HomeNavigator.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 04/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Cocoa
import DomainKit

final class HomeNavigator{
    
    let storyBoard:NSStoryboard
    let useCaseProvider:UseCaseProvider
    
    init(storyBoard:NSStoryboard,
         useCaseProvider:UseCaseProvider) {
        self.storyBoard = storyBoard
        self.useCaseProvider = useCaseProvider
    }
    
    func setHomeScreen(to windowController:NSWindowController){
        
        let homeVC:HomeViewController = storyBoard.instantiateViewController()
        homeVC.viewModel = HomeViewModel(navigator: self)
        windowController.contentViewController = homeVC
    }
}
