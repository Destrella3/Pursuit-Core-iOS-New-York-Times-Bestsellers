//
//  NYTDetailViewController.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTDetailViewController: UIViewController {

    let detailView = NYTDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)

    }

}
