	//
//  TransitionOperation.swift
//  AnimatedTransitionDrawer
//
//  Created by devang.bhatt on 12/04/17.
//  Copyright © 2017 devang.bhatt. All rights reserved.
//

import UIKit

class TransitionOperation: NSObject , UIViewControllerAnimatedTransitioning , UIViewControllerTransitioningDelegate {
    
    var snapShot : UIView?
    var isPresenting : Bool = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5 // duration in secs, means how long time it will take to complete transition
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            presentNavigation(transitionContext: transitionContext)
        } else {
            dismissNavigation(transitionContext: transitionContext)
        }
    }
    
    func presentNavigation(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let fromView = fromVC?.view
        let toVC = transitionContext.viewController(forKey: .to)
        let toView = toVC?.view
        
        let size = toView?.frame.size
        var offSetTransform = CGAffineTransform(translationX: (size?.width)! - 160, y: 0)
        offSetTransform = offSetTransform.scaledBy(x: 0.6, y: 0.6)
        
        snapShot = fromView?.snapshotView(afterScreenUpdates: true)
        
        containerView.addSubview(toView!)
        containerView.addSubview(snapShot!)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveLinear, animations: {
            
            self.snapShot?.transform = offSetTransform
            
        }, completion: { finished in
            transitionContext.completeTransition(true)
        })
    }
    
    func dismissNavigation(transitionContext: UIViewControllerContextTransitioning) {
        
        _ = transitionContext.containerView
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        _ = fromViewController!.view
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        _ = toViewController!.view
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveLinear, animations: {
            
            self.snapShot?.transform = CGAffineTransform.identity
            
        }, completion: { finished in
            transitionContext.completeTransition(true)
            self.snapShot?.removeFromSuperview()
        })
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = false
        return self
    }
}

