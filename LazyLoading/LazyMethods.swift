//
//  lazyMethods.swift
//  LazyLoading
//
//  Created by Tal Spektor on 01/01/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit

protocol LazyUtils {
    func setLayer(view: UIView)
    func setLazy(view: UIView)
    func stopLazy(view: UIView)
}
extension LazyUtils {
    
    func setLayer(view: UIView) {
        let layer  = CAGradientLayer()
        layer.colors = [UIColor.black.cgColor,UIColor.white.cgColor,UIColor.black.cgColor]
        layer.locations = [0,0.5,1]
        layer.backgroundColor = UIColor.gray.cgColor
        layer.borderColor = UIColor.white.cgColor
        layer.startPoint = CGPoint(x: 0, y :0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.masksToBounds = true
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = Float.infinity
        animation.duration = 1
        layer.add(animation, forKey: "key")
        
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        
        layer.frame = view.bounds
        maskLayer.frame = view.bounds
        view.layer.addSublayer(layer)
        view.layer.mask = maskLayer
    }
    
    func setLazy(view: UIView) {
        
        if view.subviews.count > 0 {
            for view in view.subviews {
                setLazy(view: view)
            }
        } else if view.isSkeletonable {
            setLayer(view: view)
        }
    }
    
    func stopLazy(view: UIView) {
        if view.subviews.count > 0 {
            for view in view.subviews {
                stopLazy(view: view)
            }
        } else if view.isSkeletonable {
            view.layer.sublayers?.removeAll()
        }
    }
}
