//
//  NSStoryboard.swift
//  Common
//
//  Created by Anshu Raghuvansi on 04/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

public extension NSStoryboard{
    
    static func board(named:String)->NSStoryboard{
        return NSStoryboard(name: named, bundle: nil)
    }
    
    //This function required story board Identifier should be
    //same as NSViewController class name
    func instantiateViewController<T: NSViewController>() -> T {
        return instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(T.className)) as! T
    }
    
    func instantiateWindowController<T: NSWindowController>() -> T {
        return instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(T.className)) as! T
    }
}
