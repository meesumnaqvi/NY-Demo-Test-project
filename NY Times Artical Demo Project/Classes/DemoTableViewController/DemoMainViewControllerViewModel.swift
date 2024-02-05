//
//  DemoMainViewControllerViewModel.swift
//
//  Created by Faiizziii on 02.02.2024.
//  Copyright © 2024 Faiizziii. All rights reserved.
//

import Foundation
import Combine
import CombineExt
import RealmSwift

protocol DemoMainViewControllerViewModelProtocol {
    var dataSubject: CurrentValueSubject<DemoMainViewControllerResponse?, Never> { get }
    var offlineRecords: CurrentValueSubject<DemoMainViewControllerResponse?, Never> { get }
    var error: PassthroughSubject<String?, Never> { get }
    var showHud: PassthroughSubject<Bool, Never> { get }
    var cancellable: Set<AnyCancellable> { get }
    func fetchData(days: Int)
    func saveDataToUserDefaults(data: DemoMainViewControllerResponse)
    func getDataFromUserDefaults(key: String)
}

class DemoMainViewControllerViewModel: DemoMainViewControllerViewModelProtocol {
    
    
    var dataSubject = CurrentValueSubject<DemoMainViewControllerResponse?, Never>(nil)
    var offlineRecords = CurrentValueSubject<DemoMainViewControllerResponse?, Never>(nil)
    var error = PassthroughSubject<String?, Never>()
    var showHud: PassthroughSubject<Bool, Never> = PassthroughSubject<Bool, Never>()
    var cancellable = Set<AnyCancellable>()
    
    private var realM: Realm {
        do {
            let realm = try Realm()
            return realm
        } catch {
            print("Could not able to make conenction with the database: reason -> \(error)")
        }
        return self.realM
    }
    
    private let useCase: DemoMainViewControllerUseCaseProtocol
    
    init(useCase: DemoMainViewControllerUseCaseProtocol) {
        self.useCase = useCase
    }

    
    func fetchData(days: Int) {
        showHud.send(true)
        Task {
            do {
                let data = try await self.useCase.fetchData(days: days)
                dataSubject.send(data)
                showHud.send(false)
            } catch let err {
                error.send(err.localizedDescription)
                showHud.send(false)
            }
        }
    }
    
    func saveDataToUserDefaults(data: DemoMainViewControllerResponse) {
           let encoder = JSONEncoder()
           if let encodedData = try? encoder.encode(data) {
               // Step 3: Save the data to UserDefaults
               UserDefaults.standard.set(encodedData, forKey: "mainModel")
           }
       }
       
       // Step 4: Retrieve the data from UserDefaults
       func getDataFromUserDefaults(key: String) {
           if let savedData = UserDefaults.standard.data(forKey: key) {
               let decoder = JSONDecoder()
               if let decodedData = try? decoder.decode(DemoMainViewControllerResponse.self, from: savedData) {
                   offlineRecords.send(decodedData)
               }
           }
       }
    
}
