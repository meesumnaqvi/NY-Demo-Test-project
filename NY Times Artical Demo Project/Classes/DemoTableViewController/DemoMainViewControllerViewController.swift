//
//  DemoMainViewControllerViewController.swift
//
//  Created by Faiizziii on 02.02.2024.
//  Copyright © 2024 Faiizziii. All rights reserved.
//

import UIKit
import Combine
import CombineDataSources
import CombineCocoa
import SwiftLoader


class DemoMainViewControllerViewController: UIViewController {
    
    var viewModel: DemoMainViewControllerViewModelProtocol!
    var currentView: DemoMainViewControllerView!
    var cancellable = Set<AnyCancellable>()
    
    var arrayOfItems: [Article]?
    var filteredArray: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpLoader()
        setupBindings()
        setUpNavigationBar()
    }
    
    private func setupUI() {
        // Set up UI components
        currentView = view as? DemoMainViewControllerView ?? DemoMainViewControllerView()
        if NetworkManager.sharedInstance.isNetworkConnected() {
            DispatchQueue.main.async {
                
                self.viewModel.fetchData(days: UserDefaults.standard.value(forKey: "timeSpan") as? Int ?? 7)
            }
        } else {
            self.viewModel.getDataFromUserDefaults(key: "mainModel")
        }
        
        self.currentView.tableView.dataSource = self
        self.currentView.tableView.delegate = self
    }
    
    private func setUpLoader() {
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.size = 150
        config.spinnerColor = .green
        config.foregroundColor = .black
        config.foregroundAlpha = 0.5
        SwiftLoader.setConfig(config)
    }
    
    private func setupBindings() {
        viewModel.dataSubject.dropFirst().receive(on: DispatchQueue.main)
            .sink { [weak self] model in
                // Update UI with tasks
                guard let self = self else { return }
                self.arrayOfItems = model?.results
//                UserDefaults.standard.setValue(model, forKey: "mainModel")
//                RealmManager.saveToRealm(response: arrayOfItems!)
                self.viewModel.saveDataToUserDefaults(data: model!)
                self.currentView.tableView.reloadData()
            }
            .store(in: &cancellable)
        
        viewModel.offlineRecords.receive(on: DispatchQueue.main).sink { [weak self] arrayOfItems in
            // Update UI with tasks
            guard let self = self else { return }
            self.arrayOfItems = arrayOfItems?.results
            self.currentView.tableView.reloadData()
        }
        .store(in: &cancellable)
        
        viewModel.showHud.receive(on: DispatchQueue.main).sink { [weak self] show in
            guard self != nil else { return }
            (show == true) ? SwiftLoader.show(title: "Loading...", animated: true) : SwiftLoader.hide()
        }
        .store(in: &cancellable)
        
        viewModel.error.sink { [weak self] error in
            guard self != nil else { return }
            print(error ?? "")
        }
        .store(in: &cancellable)
    }
    
    func setUpNavigationBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(menuButtonTapped))
        navigationItem.leftBarButtonItem = menuButton
        let searchButton = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(searchButtonTapped))
        searchButton.tintColor = .white
        let moreButton = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(moreButtonTapped))
        navigationItem.rightBarButtonItems = [moreButton, searchButton]
        searchButton.tintColor = .white
        menuButton.tintColor = .white
        moreButton.tintColor = .white
        navigationItem.titleView?.tintColor = .white
        self.navigationItem.title = "NY Times Most Popular"
    }
    
    @objc func menuButtonTapped() {
        print("Doing nothing in here")
    }
    
    @objc func searchButtonTapped() {
        print("Search button tapped")
        self.currentView.searchBar.isHidden ? (self.currentView.searchBar.isHidden = false) : (self.currentView.searchBar.isHidden = true)
    }
    
    @objc func moreButtonTapped() {
        print("More button tapped")
        showAlert()
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Your Alert Title", message: "Your Alert Message", preferredStyle: .actionSheet)
        
            let firstAction = UIAlertAction(title: "1 Day", style: .default) { (action) in
                UserDefaults.standard.setValue(1, forKey: "timeSpan")
                self.viewModel.fetchData(days: 1)
            }

            let secondAction = UIAlertAction(title: "7 Dayss", style: .default) { (action) in
                UserDefaults.standard.setValue(7, forKey: "timeSpan")
                self.viewModel.fetchData(days: 7)
            }

            let thirdAction = UIAlertAction(title: "30 Days", style: .default) { (action) in
                UserDefaults.standard.setValue(30, forKey: "timeSpan")
                self.viewModel.fetchData(days: 30)
            }

            alertController.addAction(firstAction)
            alertController.addAction(secondAction)
            alertController.addAction(thirdAction)

        present(alertController, animated: true, completion: nil)
        }
}

extension DemoMainViewControllerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  (filteredArray?.count ?? 0 > 0) ? (filteredArray?.count ?? 0) : (arrayOfItems?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DemoProjectTableViewCell") as? DemoProjectTableViewCell else { return UITableViewCell() }
        let data = (filteredArray?.count ?? 0 > 0) ? filteredArray : arrayOfItems
        cell.setUpViewAccordingTo(model: data?[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

extension DemoMainViewControllerViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = arrayOfItems?.filter { $0.title?.contains(searchText) ?? false }
        self.currentView.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.currentView.searchBar.isHidden = true
        filteredArray?.removeAll()
    }
}
