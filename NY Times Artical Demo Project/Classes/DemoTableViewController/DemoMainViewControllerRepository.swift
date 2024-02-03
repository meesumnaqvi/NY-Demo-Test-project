//
//  DemoMainViewControllerRepository.swift
//
//  Created by Faiizziii on 02.02.2024.
//  Copyright © 2024 Faiizziii. All rights reserved.
//

import Foundation
import Combine

protocol DemoMainViewControllerRepositoryProtocol {
    func fetchData() async throws -> DemoMainViewControllerResponse?
    // Other use cases
}

class DemoMainViewControllerRepository: DemoMainViewControllerRepositoryProtocol {
    func fetchData() async throws -> DemoMainViewControllerResponse? {
        let response = NetworkManager.sharedInstance.fetchDataFromApi()
        if response.0 == .success {
            return response.1
        } else {
            return nil
        }
    }
}
