//
//  MainTabBarController.swift
//  AppStorePractice
//
//  Created by Greed on 4/7/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    enum tabItem: CaseIterable {
        case today
        case game
        case app
        case arcade
        case search
        
        var viewController: UIViewController {
            switch self {
            case .today:
                return UINavigationController(rootViewController: TodayViewController())
            case .game:
                return UINavigationController(rootViewController: GameViewController())
            case .app:
                return UINavigationController(rootViewController: AppViewController())
            case .arcade:
                return UINavigationController(rootViewController: ArcadeViewController())
            case .search:
                return UINavigationController(rootViewController: SearchViewController())
            }
        }
        
        var tabItemIcon: UIImage! {
            switch self {
            case .today:
                return UIImage(systemName: "book")
            case .game:
                return UIImage(systemName: "gamecontroller")
            case .app:
                return UIImage(systemName: "square.stack.fill")
            case .arcade:
                return UIImage(systemName: "star")
            case .search:
                return UIImage(systemName: "magnifyingglass")
            }
        }
        
        var tabItemTitle: String {
            switch self {
            case .today:
                return "투데이"
            case .game:
                return "게임"
            case .app:
                return "앱"
            case .arcade:
                return "아케이드"
            case .search:
                return "검색"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabItemList = tabItem.allCases
        let viewControllers = tabItemList.map { $0.viewController }
        
        for index in 0..<tabItemList.count {
            viewControllers[index].tabBarItem.image = tabItemList[index].tabItemIcon
            viewControllers[index].tabBarItem.title = tabItemList[index].tabItemTitle
        }
        
        setViewControllers(viewControllers, animated: true)
    }

}
