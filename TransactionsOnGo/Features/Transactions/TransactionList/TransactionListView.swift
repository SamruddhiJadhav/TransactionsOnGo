//
//  TransactionListView.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class TransactionListView: UITableViewController, TransactionListViewProtocol {
    var presenter: TransactionListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        navigationController?.navigationBar.isHidden = false
        //navigationController?.navigationBar.backgroundColor = UIColor(white:0x7B1FA2, alpha: 1)
    }
    
    func reloadTableData() {
        tableView.reloadData()
    }
}

extension TransactionListView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.transactions?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectTransactionRow((presenter?.transactions![indexPath.row])!)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makeTransactionCell(indexPath)
    }
    
    func makeTransactionCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell") as? TransactionTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell((presenter?.transactions![indexPath.row])!)
        return cell
    }
}
