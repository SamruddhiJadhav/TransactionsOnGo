//
//  TransactionServices.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class TransactionServices {
    static func getTransactions(completion: @escaping ([String: Any]?, Error?) -> Void) {
        let url = URL(string: "https://demo4697897.mockable.io/transactions")
        let request = URLRequest(url: url!)
        let cacheResponse = URLCache.shared.cachedResponse(for: request)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let object = data, object.count > 0 {
                do {
                    let json = try JSONSerialization.jsonObject(with: object, options: [])
                    print("online data")
                    print(json)
                    completion(json as? [String : Any], nil)
                } catch {
                    print("JSONSerialization fail")
                }
            } else if error != nil {
                if let data = cacheResponse?.data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print("offline data")
                        print(json)
                        completion(json as? [String : Any], nil)
                    } catch {
                        print("JSONSerialization fail")
                    }
                } else {
                    print("Data is not available")
                    completion(nil, error)
                }
            }
            }.resume()
    }
}
