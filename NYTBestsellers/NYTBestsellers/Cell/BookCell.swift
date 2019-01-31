//
//  BookCell.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    lazy var bestSellerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "phimage")
        return image
    }()
    
    lazy var bestSellerLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of Weeks on List"
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Descritpion"
        label.numberOfLines = 1
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        setupImageView()
        setupLabel()
        setupDescriptionLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupImageView() {
        addSubview(bestSellerImage)
        bestSellerImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bestSellerImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bestSellerImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            bestSellerImage.heightAnchor.constraint(equalToConstant: 150),
            bestSellerImage.widthAnchor.constraint(equalToConstant: 125)
            ])
    }
    
    func setupLabel() {
        addSubview(bestSellerLabel)
        bestSellerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bestSellerLabel.topAnchor.constraint(equalTo: bestSellerImage.bottomAnchor, constant: 12),
            bestSellerLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            bestSellerLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)
            ])
    }
    
    func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: bestSellerLabel.bottomAnchor, constant: 21),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            ])
    }
}
