//
//  AppConfiguration.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

enum EnvironmentMode: String {
    case offline
    case online
}

class AppConfiguration {
    static var environment: EnvironmentMode?
    
    static func toggleEnvironment() {
        environment = environment == .offline ? .online : .offline
        print("Update: Environment changed to \(String(describing: environment?.rawValue))")
    }
}
