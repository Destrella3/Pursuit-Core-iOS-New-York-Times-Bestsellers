//
//  NYTDetailView.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class NYTDetailView: UIView {


    public lazy var bookImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "phimage"))
        return image
    }()
    
    public lazy var bookDetail: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = textView.font?.withSize(20)
        textView.backgroundColor = .gray
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        setupConstraints()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupConstraints() {
        addSubview(bookImage)
        addSubview(bookDetail)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookDetail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            bookImage.heightAnchor.constraint(equalToConstant: 300),
            bookImage.widthAnchor.constraint(equalToConstant: 250),
            
            bookDetail.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 21),
            bookDetail.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 21),
            bookDetail.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -21),
            bookDetail.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -21)
            ])
    }
}
