//
//  BaseNavigator.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 05/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Cocoa
import DomainKit

class BaseNavigator {
    
    let storyBoard:NSStoryboard
    let rootController:NSViewController
    let useCaseProvider:UseCaseProvider
    
    init(rootController:NSViewController,
         storyBoard:NSStoryboard,
         useCaseProvider:UseCaseProvider) {
        self.storyBoard = storyBoard
        self.rootController = rootController
        self.useCaseProvider = useCaseProvider
    }
    
    func dismiss(){
        self.rootController.presentedViewControllers?.first?.dismiss(nil)
    }
}
