//
//  SettingViewController.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingView = SettingsView()
    
    var bookClass = [Books]() {
        didSet {
            DispatchQueue.main.async {
                self.settingView.pickerView.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingView)
        uploadPickerData()
    }
    
    private func uploadPickerData() {
        settingView.pickerView.dataSource = self
        settingView.pickerView.delegate = self
        NYTBestsellerAPIClient.getCategory { (appError, bookClass) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let book = bookClass {
                self.bookClass = book
            }
        }
    }
}


extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
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
