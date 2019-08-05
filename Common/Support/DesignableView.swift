//
//  DesignableView.swift
//  Clean Architecture Mac OS
//
//  Created by Anshu Raghuvansi on 04/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Cocoa

@IBDesignable
class DesignableView: NSView {

    @IBInspectable var backgroundColor:NSColor!{
        didSet{
            wantsLayer = true
            layer?.backgroundColor = backgroundColor.cgColor
        }
    }
}
