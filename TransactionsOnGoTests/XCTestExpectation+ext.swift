//
//  XCTestExpectation+ext.swift
//  TransactionsOnGoTests
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import XCTest

extension XCTestExpectation {
    static let expectationTimeout = 0.3
        
    static func fulfill(with fulfilledDescription: String, from expectations: [XCTestExpectation]) {
        for testExpectation in expectations {
            if testExpectation.expectationDescription == fulfilledDescription {
                testExpectation.fulfill()
            }
        }
    }
}

