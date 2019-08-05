//
//  SlideUpAnimator.swift
//  Common
//
//  Created by Anshu Raghuvansi on 05/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

public final class SlideUpAnimator: NSObject,NSViewControllerPresentationAnimator {

    public func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
        
        let bottomVC = fromViewController
        let topVC = viewController
        topVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        // make sure the view has a CA layer for smooth animation
        topVC.view.wantsLayer = true
        
        // set redraw policy
        topVC.view.layerContentsRedrawPolicy = .onSetNeedsDisplay
        
        // add view of presented viewcontroller
        bottomVC.view.addSubview(topVC.view)
        
        let leading = NSLayoutConstraint(item: topVC.view, attribute: .leading, relatedBy: .equal, toItem: bottomVC.view, attribute: .leading, multiplier: 1.0, constant: 0)
        
        let trailing = NSLayoutConstraint(item: topVC.view, attribute: .trailing, relatedBy: .equal, toItem: bottomVC.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        
        let bottom = NSLayoutConstraint(item: topVC.view, attribute: .bottom, relatedBy: .equal, toItem: bottomVC.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        let top = NSLayoutConstraint(item: topVC.view, attribute: .top, relatedBy: .equal, toItem: bottomVC.view, attribute: .top, multiplier: 1.0, constant: 0)
        
        bottomVC.view.addConstraint(top)
        bottomVC.view.addConstraint(leading)
        bottomVC.view.addConstraint(trailing)
        bottomVC.view.addConstraint(bottom)
        
        // adjust size
        let viewHeight = topVC.view.frame.height
        let frame = NSRect(x: 0, y: 0, width:bottomVC.view.frame.width, height: 0)
        topVC.view.frame = frame
        
        // Do some CoreAnimation stuff to present view
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            
            // animation duration
            context.duration = 0.75
            
            let frame = NSRect(x: 0, y: 0, width:bottomVC.view.frame.width, height: viewHeight)
            topVC.view.animator().frame = frame
            
        }, completionHandler: nil)
    }
    
    
    public func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController){
        
        // make sure the view has a CA layer for smooth animation
        viewController.view.wantsLayer = true
        
        // set redraw policy
        viewController.view.layerContentsRedrawPolicy = .onSetNeedsDisplay
        
        // Do some CoreAnimation stuff to present view
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            
            // animation duration
            context.duration = 0.75
            
            let frame = NSRect(x: 0, y: 0, width:fromViewController.view.frame.width, height: 0)
            viewController.view.animator().frame = frame
            
        }, completionHandler: {
            
            // remove view
            viewController.view.removeFromSuperview()
        })
    }
}


