//
//  DemoMainViewControllerViewModel.swift
//
//  Created by Faiizziii on 02.02.2024.
//  Copyright © 2024 Faiizziii. All rights reserved.
//

import Foundation
import Combine
import CombineExt

protocol DemoMainViewControllerViewModelProtocol {
    var dataSubject: CurrentValueSubject<DemoMainViewControllerResponse?, Never> { get }
    var error: PassthroughSubject<String?, Never> { get }
    var showHud: PassthroughSubject<Bool, Never> { get }
    var cancellable: Set<AnyCancellable> { get }

    func fetchData()
}

class DemoMainViewControllerViewModel: DemoMainViewControllerViewModelProtocol {
    var dataSubject = CurrentValueSubject<DemoMainViewControllerResponse?, Never>(nil)
    var error = PassthroughSubject<String?, Never>()
    var showHud: PassthroughSubject<Bool, Never> = PassthroughSubject<Bool, Never>()
    var cancellable = Set<AnyCancellable>()

    private let useCase: DemoMainViewControllerUseCaseProtocol

    init(useCase: DemoMainViewControllerUseCaseProtocol) {
        self.useCase = useCase
    }

    func fetchData() {
        showHud.send(true)
        Task {
            do {
                let data = try await useCase.fetchData()
                dataSubject.send(data)
                showHud.send(false)
            } catch let err {
                error.send(err.localizedDescription)
                showHud.send(false)
            }
        }
    }
}
