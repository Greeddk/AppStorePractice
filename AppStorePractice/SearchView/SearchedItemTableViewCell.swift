//
//  SearchedItemTableViewCell.swift
//  AppStorePractice
//
//  Created by Greed on 4/7/24.
//

import UIKit
import SnapKit
import Kingfisher

final class SearchedItemTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    let appIcon = {
        let view = UIImageView()
        return view
    }()
    
    let appTitle = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 16)
        return view
    }()
    
    let downButton = {
        let view = UIButton()
        view.setTitle("받기", for: .normal)
        view.setTitleColor(.systemBlue, for: .normal)
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 15
        return view
    }()
    
    let ratingImage = {
        let view = UIImageView()
        view.image = UIImage(systemName: "star.fill")
        return view
    }()
    
    let ratingLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12)
        view.textColor = .lightGray
        return view
    }()
    
    let corpName = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12)
        view.textColor = .lightGray
        return view
    }()
    
    let category = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12)
        view.textColor = .lightGray
        return view
    }()
    
    let appImageOne = {
        let view = UIImageView()
        return view
    }()
    
    let appImageTwo = {
        let view = UIImageView()
        return view
    }()
    
    let appImageThree = {
        let view = UIImageView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        setConstraints()
    }
    
    override func layoutSubviews() {
        let imageWidth = (contentView.frame.width - 8) / 3
        appImageOne.snp.makeConstraints { make in
            make.top.equalTo(ratingImage.snp.bottom).offset(8)
            make.leading.equalTo(appIcon)
            make.width.equalTo(imageWidth)
            make.height.equalTo(2 * imageWidth)
        }
        appImageTwo.snp.makeConstraints { make in
            make.top.equalTo(appImageOne)
            make.leading.equalTo(appImageOne.snp.trailing).offset(4)
            make.width.equalTo(imageWidth)
            make.height.equalTo(2 * imageWidth)
        }
        appImageThree.snp.makeConstraints { make in
            make.top.equalTo(appImageTwo)
            make.leading.equalTo(appImageTwo.snp.trailing).offset(4)
            make.width.equalTo(imageWidth)
            make.height.equalTo(2 * imageWidth)
        }
        appImageOne.layer.cornerRadius = 8
        appImageOne.clipsToBounds = true
        appImageTwo.layer.cornerRadius = 8
        appImageTwo.clipsToBounds = true
        appImageThree.layer.cornerRadius = 8
        appImageThree.clipsToBounds = true
        appIcon.layer.cornerRadius = 8
        appIcon.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        [appIcon, appTitle, downButton, ratingImage, ratingLabel, corpName, category, appImageOne, appImageTwo, appImageThree].forEach { contentView.addSubview($0)}
    }
    
    func setConstraints() {
        appIcon.snp.makeConstraints { make in
            make.leading.top.equalTo(contentView.safeAreaLayoutGuide).inset(4)
            make.size.equalTo(48)
        }
        appTitle.snp.makeConstraints { make in
            make.centerY.equalTo(appIcon)
            make.leading.equalTo(appIcon.snp.trailing).offset(4)
            make.trailing.equalTo(downButton.snp.leading).offset(-4)
        }
        downButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView)
            make.centerY.equalTo(appIcon)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        ratingImage.snp.makeConstraints { make in
            make.leading.equalTo(appIcon)
            make.top.equalTo(appIcon.snp.bottom).offset(8)
            make.size.equalTo(12)
        }
        ratingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(ratingImage)
            make.leading.equalTo(ratingImage.snp.trailing).offset(4)
        }
        corpName.snp.makeConstraints { make in
            make.centerY.equalTo(ratingImage)
            make.centerX.equalTo(contentView)
        }
        category.snp.makeConstraints { make in
            make.centerY.equalTo(ratingImage)
            make.trailing.equalTo(downButton)
        }
    }
    
    func configureCell(item: AppInfo) {
        let url = URL(string: item.icon)
        appIcon.kf.setImage(with: url)
        appTitle.text = item.appName
        ratingLabel.text = String(format: "%.1f", item.averageUserRating)
        corpName.text = item.sellerName
        category.text = item.genres.first
        var imageURL: [URL] = []
        for index in 0..<3 {
            imageURL.append(URL(string: item.screenshotUrls[index])!)
        }
        appImageOne.kf.setImage(with: imageURL[0])
        appImageTwo.kf.setImage(with: imageURL[1])
        appImageThree.kf.setImage(with: imageURL[2])

    }
    
}
