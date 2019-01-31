//
//  NYTView.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 180, height: 250)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        let ct = UICollectionView.init(frame: self.frame, collectionViewLayout: layout)
        ct.backgroundColor = .white
        
        return ct
    }()
 
    lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = .white
        return pv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        collectionView.register(BookCell.self, forCellWithReuseIdentifier: "BookCell")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
}

extension NYTView {
    private func setupViews() {
        setupCollectionView()
        setupPickerView()
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: widthAnchor),
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
            ])
    }
    
    private func setupPickerView() {
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            pickerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            pickerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            pickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
            ])
    }
}




