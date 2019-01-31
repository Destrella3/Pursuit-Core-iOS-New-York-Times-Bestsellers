//
//  FavoriteViewController.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    let favView = FavoriteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favView)
        
    }
}

