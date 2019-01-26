//
//  NYTViewController.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTViewController: UIViewController {

    let nytView = NYTView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nytView)
        
    }

}
