//
//  ViewModelProtocol.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 05/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

protocol ViewModelProtocol:ViewModelInputProtocol,
ViewModelOutputProtocol {
    
}

protocol ViewModelInputProtocol {
    
    associatedtype Input
    
    var input: Input! { get }
    
    func handleInput()
}

protocol ViewModelOutputProtocol {
    
    associatedtype Output
    
    var output: Output! { get }
}
