//
//  DemoMainViewControllerUseCase.swift
//
//  Created by Faiizziii on 02.02.2024.
//  Copyright © 2024 Faiizziii. All rights reserved.
//

import Foundation
import Combine

protocol DemoMainViewControllerUseCaseProtocol {
    func fetchData() async throws -> DemoMainViewControllerResponse?
    // Other use cases
}

class DemoMainViewControllerUseCase: DemoMainViewControllerUseCaseProtocol {
    private let repository: DemoMainViewControllerRepositoryProtocol

    init(repository: DemoMainViewControllerRepositoryProtocol) {
        self.repository = repository
    }

    func fetchData() async throws -> DemoMainViewControllerResponse?  {
        try await repository.fetchData()
    }

    // Implement other use cases
}
