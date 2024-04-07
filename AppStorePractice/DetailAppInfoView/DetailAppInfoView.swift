//
//  DetailAppInfoView.swift
//  AppStorePractice
//
//  Created by Greed on 4/7/24.
//

import UIKit
import SnapKit
import Kingfisher

final class DetailAppInfoView: BaseView {
    
    let scrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    let contentView = UIView()

    let appIcon = {
        let view = UIImageView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let appTitle = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 16)
        return view
    }()
    
    let corpName = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12)
        view.textColor = .lightGray
        return view
    }()
    
    let downButton = {
        let view = UIButton()
        view.setTitle("받기", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        return view
    }()
    
    let releaseLabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 20)
        view.text = "새로운 소식"
        return view
    }()
    
    let releaseVer = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12)
        view.textColor = .lightGray
        return view
    }()
    
    let releaseNews = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.numberOfLines = 0
        return view
    }()
    
    let imageScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    let imageContentView = UIView()
    
    var imageViews: [UIImageView] = []
    
    let appDescription = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    override func configureHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [appIcon, appTitle, corpName, downButton, releaseLabel, releaseVer, releaseNews, imageScrollView, appDescription].forEach { view in
            contentView.addSubview(view)
        }
        imageScrollView.addSubview(imageContentView)
    }
    
    override func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        appIcon.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(12)
            make.size.equalTo(80)
        }
        appTitle.snp.makeConstraints { make in
            make.top.equalTo(appIcon.snp.top).offset(12)
            make.leading.equalTo(appIcon.snp.trailing).offset(12)
            make.trailing.equalTo(contentView).offset(-4)
        }
        corpName.snp.makeConstraints { make in
            make.leading.equalTo(appTitle)
            make.top.equalTo(appTitle.snp.bottom).offset(8)
        }
        downButton.snp.makeConstraints { make in
            make.leading.equalTo(appTitle)
            make.bottom.equalTo(appIcon.snp.bottom)
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
        releaseLabel.snp.makeConstraints { make in
            make.leading.equalTo(appIcon)
            make.top.equalTo(appIcon.snp.bottom).offset(20)
        }
        releaseVer.snp.makeConstraints { make in
            make.top.equalTo(releaseLabel.snp.bottom).offset(8)
            make.leading.equalTo(releaseLabel)
        }
        releaseNews.snp.makeConstraints { make in
            make.leading.equalTo(appIcon)
            make.top.equalTo(releaseVer.snp.bottom).offset(12)
            make.trailing.equalTo(contentView).offset(-4)
        }
        imageScrollView.snp.makeConstraints { make in
            make.top.equalTo(releaseNews.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(500)
        }
        imageContentView.snp.makeConstraints { make in
            make.edges.equalTo(imageScrollView)
            make.height.equalTo(imageScrollView)
        }
        appDescription.snp.makeConstraints { make in
            make.top.equalTo(imageScrollView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(12)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    func setUI(item: AppInfo) {
        let url = URL(string: item.icon)
        appIcon.kf.setImage(with: url)
        appTitle.text = item.appName
        corpName.text = item.sellerName
        releaseVer.text = "버전 \(item.version)"
        releaseNews.text = item.releaseNotes
        imageScrollView.addSubview(imageContentView)
        for index in 0...item.screenshotUrls.count - 1 {
            let imageURL = URL(string: item.screenshotUrls[index])
            imageViews.append(UIImageView())
            imageContentView.addSubview(imageViews[index])
            if index == item.screenshotUrls.count - 1 {
                imageViews[index].snp.makeConstraints { make in
                    make.leading.equalTo(imageViews[index - 1].snp.trailing).offset(8)
                    make.trailing.equalTo(imageContentView.snp.trailing).offset(-8)
                    make.width.equalTo(250)
                    make.height.equalTo(500)
                }
            } else {
                imageViews[index].snp.makeConstraints { make in
                    make.leading.equalTo(imageContentView).offset(258 * index + 8)
                    make.width.equalTo(250)
                    make.height.equalTo(500)
                }
            }
            imageViews[index].kf.setImage(with: imageURL)
            imageViews[index].layer.cornerRadius = 8
            imageViews[index].clipsToBounds = true
        }
        appDescription.text = item.description
    }

}
