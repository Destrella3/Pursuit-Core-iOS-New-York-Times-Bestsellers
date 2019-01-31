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
    
    var books = [BookData]()
    
    var bookClass = [Books]() {
        didSet {
            DispatchQueue.main.async {
                self.nytView.pickerView.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nytView)
        uploadPickerData()
        uploadCollectionData()
    }
    
    private func uploadCollectionData() {
        NYTBestsellerCollectionAPIClient.getCollection { (appError, collection) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let data = collection {
                self.books = data
            }
        }
    }
    
    private func uploadPickerData() {
        nytView.pickerView.dataSource = self
        nytView.pickerView.delegate = self
        NYTBestsellerAPIClient.getCategory { (appError, bookClass) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let book = bookClass {
                self.bookClass = book
            }
        }
    }
}

extension NYTViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookClass.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookClass[row].listName
    }
}

extension NYTViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(NYTDetailViewController(), animated: true)
    }
}
