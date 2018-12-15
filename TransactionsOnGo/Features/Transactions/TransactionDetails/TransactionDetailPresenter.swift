//
//  TransactionDetailPresenter.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 08/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class TransactionDetailPresenter: TransactionDetailPresenterProtocol {
    
    // MARK: - TransactionDetailPresenterProtocol Variables
    var view: TransactionDetailViewProtocol?
    var wireframe: TransactionDetailWireframeProtocol?
    
    var transaction: Transaction?
}
