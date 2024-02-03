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
    func fetchDataFromApi() -> (NetworkCallResults?, DemoMainViewControllerResponse?) {
        if !isNetworkConneted() {
            return (NetworkCallResults.noNetwork, nil)
        }
        let url = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=6ynxQYLWbjUxQp2S3uE2jSEqWvmoAWBZ";
        var model: DemoMainViewControllerResponse?
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response{ resp in
                switch resp.result{
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(DemoMainViewControllerResponse.self, from: data!)
                        model = jsonData
                        print(jsonData)
                        
                    } catch {
                        print(error.localizedDescription)
                    }

                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        return(NetworkCallResults.success, model)
    }
    
    private func isNetworkConneted() -> Bool {
        let reachabilityManager = NetworkReachabilityManager()
        return reachabilityManager?.isReachable ?? false
    }
}

