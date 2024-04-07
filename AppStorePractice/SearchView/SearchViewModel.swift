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
        let searchTap: ControlEvent<Void>
    }
    
    struct Output {
        let appList: PublishRelay<[AppInfo]>
    }
    
     func transform(input: Input) -> Output {
        let appList = PublishRelay<[AppInfo]>()
         
         input.searchTap
             .withLatestFrom(input.searchQuery)
             .flatMap {
                 SearchManager.fetchApps(query: $0)
             }
             .bind(with: self) { owner, value in
                 let data = value.results
                 appList.accept(data)
             }
             .disposed(by: disposeBag)
        
        return Output(appList: appList)
    }
    
}
