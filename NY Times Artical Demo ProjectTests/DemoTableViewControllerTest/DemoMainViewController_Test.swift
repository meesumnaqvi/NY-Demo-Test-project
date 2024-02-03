//
//  DemoMainViewControllerTestCase.swift
//
//  Created by Faiizziii on 02.02.2024.
//  Copyright © 2024 Faiizziii. All rights reserved.
//

import XCTest
import Combine
@testable import Pura_V2

final class DemoMainViewControllerViewModelTests: XCTestCase {
    var viewModel: DemoMainViewControllerViewModel!
    var cancellable = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Create a mock sample repository that should succeed
        let mockRepository = MockDemoMainViewControllerRepository()
        mockRepository.shouldSucceed = true

        // Create a mock use case with the mock repository
        let useCase = MockDemoMainViewControllerUseCase(repository: mockRepository)

        // Create the view model with the mock use case
        viewModel = DemoMainViewControllerViewModel(useCase: useCase)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchDataSuccess() {
        // Expectation to wait for data to be received
        let expectation = XCTestExpectation(description: "Fetch samples successful")

        // Subscribe to the samples subject
        viewModel.dataSubject
            .sink { data in
                if data == nil {
                    return
                }
//                XCTAssertEqual(samples.count, 1)
//                XCTAssertEqual(samples.first?.id, "1")
//                XCTAssertEqual(samples.first?.title, "Sample 1")
//                XCTAssertEqual(samples.first?.isCompleted, true)
                expectation.fulfill()
            }
            .store(in: &cancellable)
        // Call the fetchData method
        viewModel.fetchData()

        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchDataFailure() {
        // Create a mock repository that should fail
        let mockRepository = MockDemoMainViewControllerRepository()
        mockRepository.shouldSucceed = false

        // Create a mock use case with the mock repository
        let useCase = MockDemoMainViewControllerUseCase(repository: mockRepository)

        // Create the view model with the sample use case
        let viewModel = DemoMainViewControllerViewModel(useCase: useCase)

        // Expectation to wait for an error to be received
        let expectation = XCTestExpectation(description: "Fetch samples failed")

        // Subscribe to the error subject
        let cancellable = viewModel.error
            .sink { errorString in
                XCTAssertNotNil(errorString)
                expectation.fulfill()
            }

        // Call the fetchSamples method
        viewModel.fetchData()

        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 1.0)

        // Cancel the cancellable
        cancellable.cancel()
    }
}

// MARK: - Mock DemoMainViewController Repository

class MockDemoMainViewControllerRepository: DemoMainViewControllerRepositoryProtocol {
    var shouldSucceed = true // Customize this flag to control whether the mock should succeed or fail

    func fetchData() async throws -> EmptyResponseObject? {
        if shouldSucceed {
            return EmptyResponseObject()
        } else {
            throw NSError(domain: "MockErrorDomain", code: 123, userInfo: nil) // Simulate an error
        }
    }
}

// MARK: - Mock DemoMainViewController UseCase

class MockDemoMainViewControllerUseCase: DemoMainViewControllerUseCaseProtocol {
    let repository: DemoMainViewControllerRepositoryProtocol

    init(repository: DemoMainViewControllerRepositoryProtocol) {
        self.repository = repository
    }

    func fetchData() async throws -> EmptyResponseObject? {
        let data = try await repository.fetchData()
        return data
    }
}