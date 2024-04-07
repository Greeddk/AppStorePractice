//
//  SearchView.swift
//  AppStorePractice
//
//  Created by Greed on 4/7/24.
//

import UIKit
import SnapKit

final class SearchView: BaseView {

    let tableView = UITableView()
    
    override func configureHierarchy() {
        self.addSubview(tableView)
    }
    
    override func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(8)
        }
    }
    
    override func configureView() {
        tableView.register(SearchedItemTableViewCell.self, forCellReuseIdentifier: SearchedItemTableViewCell.identifier)
        tableView.rowHeight = 350
    }
}
