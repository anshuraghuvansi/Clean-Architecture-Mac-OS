//
//  FadeAnimator.swift
//  Common
//
//  Created by Anshu Raghuvansi on 05/08/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation

public final class FadeAnimator: NSObject, NSViewControllerPresentationAnimator {
    
    public func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController){
        
        let bottomVC = fromViewController
        let topVC = viewController
        topVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        // make sure the view has a CA layer for smooth animation
        topVC.view.wantsLayer = true
        
        // set redraw policy
        topVC.view.layerContentsRedrawPolicy = .onSetNeedsDisplay
        
        // start out invisible
        topVC.view.alphaValue = 0
        
        // add view of presented viewcontroller
        bottomVC.view.addSubview(topVC.view)
        
        let leading = NSLayoutConstraint(item: topVC.view, attribute: .leading, relatedBy: .equal, toItem: bottomVC.view, attribute: .leading, multiplier: 1.0, constant: 0)
        
        let trailing = NSLayoutConstraint(item: topVC.view, attribute: .trailing, relatedBy: .equal, toItem: bottomVC.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        
        let bottom = NSLayoutConstraint(item: topVC.view, attribute: .bottom, relatedBy: .equal, toItem: bottomVC.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        let top = NSLayoutConstraint(item: topVC.view, attribute: .top, relatedBy: .equal, toItem: bottomVC.view, attribute: .top, multiplier: 1.0, constant: 0)
        
        bottomVC.view.addConstraint(leading)
        bottomVC.view.addConstraint(trailing)
        bottomVC.view.addConstraint(top)
        bottomVC.view.addConstraint(bottom)
        
        // Do some CoreAnimation stuff to present view
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            
            // fade duration
            context.duration = 0.75
            // animate to alpha 1
            topVC.view.animator().alphaValue = 1
        }, completionHandler: nil)
        
    }
    
    public func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController){
        
        // make sure the view has a CA layer for smooth animation
        viewController.view.wantsLayer = true
        
        // set redraw policy
        viewController.view.layerContentsRedrawPolicy = .onSetNeedsDisplay
        
        // Do some CoreAnimation stuff to present view
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            
            // fade duration
            context.duration = 0.75
            // animate view to alpha 0
            viewController.view.animator().alphaValue = 0
            
        }, completionHandler: {
            
            // remove view
            viewController.view.removeFromSuperview()
        })
    }
}
