//
//  DemoMainViewControllerUseCase.swift
//
//  Created by Faiizziii on 02.02.2024.
//  Copyright © 2024 Faiizziii. All rights reserved.
//

import Foundation
import Combine

protocol DemoMainViewControllerUseCaseProtocol {
    func fetchData(days: Int) async throws -> DemoMainViewControllerResponse?
}

class DemoMainViewControllerUseCase: DemoMainViewControllerUseCaseProtocol {
    private let repository: DemoMainViewControllerRepositoryProtocol
    
    init(repository: DemoMainViewControllerRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchData(days: Int) async throws -> DemoMainViewControllerResponse?  {
        try await repository.fetchData(days: days)
    }
    
}
