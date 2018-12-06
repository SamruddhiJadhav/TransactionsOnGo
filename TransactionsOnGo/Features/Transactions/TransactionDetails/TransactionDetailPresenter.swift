//
//  TransactionDetailPresenter.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class TransactionDetailPresenter: TransactionDetailPresenterProtocol {
    var view: TransactionDetailViewProtocol?
    var wireframe: TransactionDetailWireframeProtocol?
    var transaction: Transaction?
    
}
