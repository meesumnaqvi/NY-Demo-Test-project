//
//  NetworkManager.swift
//  NY Times Artical Demo Project
//
//  Created by M Faizan Mujahid on 03/02/2024.
//

import Foundation
import Alamofire

enum NetworkCallResults: Error {
    case requestFailed
    case invalidResponse
    case decodingError
    case noNetwork
    case success
}

class NetworkManager {
    static let sharedInstance = NetworkManager()
    
    func fetchDataFromApi(days: Int) -> (NetworkCallResults?, DemoMainViewControllerResponse?) {
        if !isNetworkConnected() {
            return (NetworkCallResults.noNetwork, nil)
        }

        let url = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/%d.json?api-key=6ynxQYLWbjUxQp2S3uE2jSEqWvmoAWBZ"
        let formatedURl = String(format: url, days)
        var model: DemoMainViewControllerResponse?
        var result: (NetworkCallResults?, DemoMainViewControllerResponse?) = (nil, nil)

        let semaphore = DispatchSemaphore(value: 0)

        AF.request(formatedURl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { resp in
                defer {
                    semaphore.signal()
                }

                switch resp.result {
                case .success(let data):
                    do {
                        let jsonData = try JSONDecoder().decode(DemoMainViewControllerResponse.self, from: data!)
                        model = jsonData
                        print(jsonData)
                        result = (NetworkCallResults.success, model)
                    } catch {
                        print(error.localizedDescription)
                        result = (NetworkCallResults.decodingError, nil)
                    }

                case .failure(let error):
                    print(error.localizedDescription)
                    result = (NetworkCallResults.requestFailed, nil)
                }
            }

        _ = semaphore.wait(timeout: .distantFuture)
        return result
    }
    
    func isNetworkConnected() -> Bool {
        let reachabilityManager = NetworkReachabilityManager()
        return reachabilityManager?.isReachable ?? false
    }
}

