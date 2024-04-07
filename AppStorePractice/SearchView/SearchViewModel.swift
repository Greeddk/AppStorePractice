//
//  SearchViewModel.swift
//  AppStorePractice
//
//  Created by Greed on 4/7/24.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel {
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let searchQuery: PublishRelay<String>
    }
    
    struct Output {
        let appList: PublishRelay<[AppInfo]>
    }
    
     func transform(input: Input) -> Output {
        let appList = PublishRelay<[AppInfo]>()
        
        input.searchQuery
             .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .flatMap {
                SearchManager.fetchApps(query: $0)
            }
            .subscribe(with: self) { owner, value in
                let data = value.results
                print(data)
                appList.accept(data)
            }
            .disposed(by: disposeBag)
        
        return Output(appList: appList)
    }
    
}
