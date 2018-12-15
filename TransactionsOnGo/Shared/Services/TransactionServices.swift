//
//  TransactionServices.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class TransactionServices: TransactionServicesProtocol {
    
    // MARK: - TransactionServicesProtocol Method
    func getTransactions(completion: @escaping ([String: Any]?, Error?) -> Void) {
        
        if let configuration = AppConfiguration.environment,
            configuration == .offline {
            getTransactionsForOfflineMode(completion: completion)
        } else {
            let url = URL(string: StringConstants.GET_TRANSACTIONS_URL)
            guard let urlValue = url else {
                return
            }
            let request = URLRequest(url: urlValue)
            if !ReachabilityManager.isConnectedToNetwork() {
                getTransactionsFromCache(request, completion: completion)
            } else {
                getTransactionsFromService(request, completion: completion)
            }
        }
        
    }

    // MARK: - Helper Methods
    private func getTransactionsForOfflineMode(completion: @escaping ([String: Any]?, Error?) -> Void) {
        if let path = Bundle.main.path(forResource: "Transactions", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                print("Log: Data from JSON: \(jsonResult)")
                completion(jsonResult as? [String : Any], nil)
            } catch {
                print("Error: Could not get data from JSON")
                completion(nil, nil)
            }
        }
    }
    
    private func getTransactionsFromService(_ request: URLRequest, completion: @escaping ([String: Any]?, Error?) -> Void) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let object = data, object.count > 0 {
                do {
                    let json = try JSONSerialization.jsonObject(with: object, options: [])
                    print("Log: Data from Service: \(json)")
                    completion(json as? [String : Any], nil)
                } catch {
                    completion(nil, nil)
                    print("Error: JSONSerialization fail")
                }
            } else if error != nil {
                completion(nil, error)
            }
            }.resume()
    }
    
    private func getTransactionsFromCache(_ request: URLRequest, completion: @escaping ([String: Any]?, Error?) -> Void) {
        let cacheResponse = URLCache.shared.cachedResponse(for: request)
        if let data = cacheResponse?.data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("Log: Data From Cache: \(json)")
                completion(json as? [String : Any], nil)
            } catch {
                completion(nil, nil)
                print("Error: JSONSerialization fail")
            }
        } else {
            print("Error: Data is not available")
            completion(nil, nil)
        }
    }
}
