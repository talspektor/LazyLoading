//
//  Extension + UIView.swift
//  LazyLoading
//
//  Created by Tal Spektor on 01/01/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit

enum AssociationPolicy: UInt {
    case assign = 0
    
    var objc: objc_AssociationPolicy {
        return objc_AssociationPolicy(rawValue: rawValue)!
    }
}

extension UIView {
    enum AssociatedKey {
        static var skeletonable = "skeletonable"
    }
    
    var skeletonable: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.skeletonable) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.skeletonable, newValue, AssociationPolicy.assign.objc)
        }
    }
    
    @IBInspectable
    var isSkeletonable: Bool {
        get {
            return skeletonable

        }
        set {
            skeletonable = newValue
        }
    }
}
