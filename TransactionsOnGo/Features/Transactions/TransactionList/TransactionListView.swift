//
//  TransactionListView.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class TransactionListView: UITableViewController, TransactionListViewProtocol {
    
    // MARK: - TransactionListViewProtocol Variable
    var presenter: TransactionListPresenterProtocol?
    
    // MARK: - TransactionListView Constant
    static let TRANSACTION_TABLE_VIEW_CELL = "TransactionTableViewCell"
    
    // MARK: - TransactionListView Variables
    let loadingIndicatorView = UIView()
    let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.title = StringConstants.TRANSACTIONS_TITLE
    }
    
    // MARK: - Helper Methods
    func setupTableView() {
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = StringConstants.SIGN_OUT_LABEL
        setupLoadingIndicator()
    }
    
    func setupLoadingIndicator() {
        loadingIndicatorView.frame = view.frame
        loadingIndicatorView.backgroundColor = .lightGray
        loadingIndicatorView.isHidden = true
        
        setupSpinner()
    }
    
    func setupSpinner() {
        loadingIndicator.center = CGPoint(
            x: UIScreen.main.bounds.size.width / 2,
            y: UIScreen.main.bounds.size.height / 2
        )
        loadingIndicator.color = .gray
        loadingIndicator.hidesWhenStopped = true
        loadingIndicatorView.addSubview(loadingIndicator)
        view.addSubview(loadingIndicatorView)
    }
    
    // MARK: - TransactionListViewProtocol Methods
    func reloadTableView() {
        hideLoadingIndicator()
        tableView.reloadData()
    }
    
    func showErrorMessage(_ message: String) {
        let alert = UIAlertController(title: StringConstants.ERROR_TITLE,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: StringConstants.OK_LABEL,
                                      style: .default,
                                      handler: { [weak self] action in
            self?.presenter?.okButtonClicked()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func showLoadingIndicator() {
        DispatchQueue.main.async {
            self.loadingIndicator.startAnimating()
            self.loadingIndicatorView.isHidden = false
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
            self.loadingIndicatorView.isHidden = true
        }
    }
}

extension TransactionListView {
    
    // MARK: - Table View Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.transactions?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let transaction = presenter?.transactions?[indexPath.row],
              let transactionId = transaction.transactionId, !transactionId.isEmpty else {
            return
        }
        presenter?.didSelectTransactionRow(transaction)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makeTransactionCell(indexPath)
    }
    
    func makeTransactionCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionListView.TRANSACTION_TABLE_VIEW_CELL) as? TransactionTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell((presenter?.transactions?[indexPath.row]))
        return cell
    }
}

