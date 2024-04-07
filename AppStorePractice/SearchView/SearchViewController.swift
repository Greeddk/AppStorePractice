//
//  SearchViewController.swift
//  AppStorePractice
//
//  Created by Greed on 4/7/24.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    
    let viewModel = SearchViewModel()
    
    let searchController = UISearchController()
    
    let disposeBag = DisposeBag()
    
    var appList: [AppInfo] = []
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    override func configureView() {
        navigationItem.title = "검색"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }
    
    private func bind() {
        let searchQuery = PublishRelay<String>()
        let searchButtonTap = PublishRelay<Void>()
        
        let input = SearchViewModel.Input(searchQuery: searchQuery)
        
        let output = viewModel.transform(input: input)
        
        searchController.searchBar.rx.text.orEmpty
            .bind(with: self) { owner, value in
                searchQuery.accept(value)
            }
            .disposed(by: disposeBag)
        
        output.appList
            .bind(to: mainView.tableView.rx.items(cellIdentifier: SearchedItemTableViewCell.identifier, cellType: SearchedItemTableViewCell.self)) { (row, element, cell) in
                cell.configureCell(item: element)
            }
            .disposed(by: disposeBag)
        
    }

}
