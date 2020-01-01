//
//  ViewController.swift
//  LazyLoading
//
//  Created by Tal Spektor on 30/12/2019.
//  Copyright © 2019 Tal Spektor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LazyUtils {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLazy(view: view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            for view in self.view.subviews {
//                view.layer.sublayers?.removeAll()
//            }
            self.stopLazy(view: self.view)
            self.label1.text = "label 1"
            self.label2.text = "label 2"
            self.label3.text = "label 3"
        }
    }


}

