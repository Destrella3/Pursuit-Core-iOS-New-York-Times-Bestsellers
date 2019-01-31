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
    
    var books = [BookData]() {
        didSet {
            DispatchQueue.main.async {
                self.nytView.collectionView.reloadData()
            }
        }
    }
    
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
        dump(books)
        dump(bookClass)
    }
    
    private func uploadCollectionData() {
        nytView.collectionView.delegate = self
        nytView.collectionView.dataSource = self
        NYTBestsellerCollectionAPIClient.getCollection(list: "Combined-Print-and-E-Book-Fiction") { (appError, collection) in
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

extension NYTViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCell else {return UICollectionViewCell()}
        let weekToSet = books[indexPath.row]
        let bookToSet = books[indexPath.row].bookDetails
        cell.descriptionLabel.text = bookToSet.first?.description
        cell.bestSellerLabel.text = "\(weekToSet.weeksOnList) weeks on Bestseller List"
        return cell
    }
}

extension NYTViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(NYTDetailViewController(), animated: true)
    }
}

