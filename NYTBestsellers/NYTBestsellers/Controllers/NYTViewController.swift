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
    var pickerTitle = "" {
        didSet {
            uploadCollectionData()
        }
    }
    var googleBooks = [BookInfo]()
    
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
    }
    
    private func uploadCollectionData() {
        nytView.collectionView.delegate = self
        nytView.collectionView.dataSource = self
        NYTBestsellerCollectionAPIClient.getCollection(list: pickerTitle.replacingOccurrences(of: " ", with: "-")) { (appError, collection) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let data = collection {
                self.books = data
            }
        }
        NYTBestsellerDetailAPIClient.getDetails { (appError, info) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let info = info {
                self.googleBooks = info
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         self.pickerTitle = bookClass[row].listName
    }
}

extension NYTViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCell else {return UICollectionViewCell()}
        let booksToSet = books[indexPath.row]
        let bookToSet = books[indexPath.row].bookDetails
        cell.descriptionLabel.text = bookToSet.first?.description
        cell.bestSellerLabel.text = "\(booksToSet.weeksOnList) weeks on Bestseller List"
        ImageHelper.fetchImageFromNetwork(urlString: googleBooks.first?.imageLinks.first?.smallThumbnail.description ?? "") { (appError, image) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let image = image {
                cell.bestSellerImage.image = image
            }
        }
        return cell
    }
}

extension NYTViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(NYTDetailViewController(), animated: true)
    }
}
