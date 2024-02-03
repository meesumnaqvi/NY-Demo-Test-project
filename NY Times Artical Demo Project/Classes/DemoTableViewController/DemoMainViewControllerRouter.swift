//
//  DemoMainViewControllerRouter.swift
//
//  Created by Faiizziii on 02.02.2024.
//  Copyright © 2024 Faiizziii. All rights reserved.
//

import Foundation
import UIKit
import Combine

class DemoMainViewControllerRouter {
    static func createModule() -> DemoMainViewControllerViewController {
        let repository = DemoMainViewControllerRepository()
        let useCase = DemoMainViewControllerUseCase(repository: repository)
        let viewModel = DemoMainViewControllerViewModel(useCase: useCase)

        let viewController = DemoMainViewControllerViewController(nibName: "DemoMainViewControllerViewController", bundle: nil)
        viewController.viewModel = viewModel

        return viewController
    }
    /*
    func navigateToViewController(from: UIViewController) {
        // Navigate to Sample Detail
    }
    */
}