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

class DemoMainViewControllerViewController: UIViewController {
    var viewModel: DemoMainViewControllerViewModelProtocol!
    var currentView: DemoMainViewControllerView!
    var cancellable = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }

    private func setupUI() {
        // Set up UI components
        currentView = view as? DemoMainViewControllerView ?? DemoMainViewControllerView()
        viewModel.fetchData()
    }

    private func setupBindings() {
        viewModel.dataSubject
            .sink { [weak self] _ in
                // Update UI with tasks
            }
            .store(in: &cancellable)

        viewModel.showHud.sink { [weak self] show in
            
        }
        .store(in: &cancellable)

        viewModel.error.sink { [weak self] error in
            print(error ?? "")
        }
        .store(in: &cancellable)

//        currentView.navigationBar.backSubject
//            .sink { [weak self] _ in
//                self?.onBackPressed()
//
//            }
//            .store(in: &cancellable)
    }
}

extension DemoMainViewControllerViewController {
//    func onBackPressed() {
//        self.popViewController(animated: true)
//    }
}
