//
//  DetailAppInfoViewController.swift
//  AppStorePractice
//
//  Created by Greed on 4/7/24.
//

import UIKit

final class DetailAppInfoViewController: BaseViewController {
    
    let mainView = DetailAppInfoView()
    var data: AppInfo!
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func configureView() {
        mainView.setUI(item: data)
    }
    
}
