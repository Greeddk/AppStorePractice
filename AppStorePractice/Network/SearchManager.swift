//
//  SearchManager.swift
//  AppStorePractice
//
//  Created by Greed on 4/7/24.
//

import Foundation
import RxSwift

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case statusError
}

final class SearchManager {
    
    static func fetchApps(query: String) -> Observable<SearchResult> {
        
        return Observable<SearchResult>.create() { observer in
            guard let url = URL(string: "https://itunes.apple.com/search?term=\(query)&country=kr&entity=software") else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let _ = error {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    observer.onError(APIError.statusError)
                    return
                }
                
                if let data = data, let appData = try? JSONDecoder().decode(SearchResult.self, from: data) {
                    observer.onNext(appData)
                    observer.onCompleted()
                } else {
                    observer.onError(APIError.unknownResponse)
                }
            }.resume()
            
            return Disposables.create()
        }
        
    }
    
}
