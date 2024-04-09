# AppStore 검색 및 상세페이지 구현 연습

## 스크린샷
<p align="center">
<img width="30%" alt="스크린샷 2024-04-09 오후 7 53 55" src="https://github.com/Greeddk/AppStorePractice/assets/116425551/90d6565d-6e91-4555-b3db-d0f9ccde393b">
<img width="30%" alt="스크린샷 2024-04-09 오후 7 54 03" src="https://github.com/Greeddk/AppStorePractice/assets/116425551/8ba4ce02-1e11-441d-8c76-9915b1606ede">
<img width="30%" alt="스크린샷 2024-04-09 오후 7 54 17" src="https://github.com/Greeddk/AppStorePractice/assets/116425551/42b3e306-c708-4910-b434-d784855439f1">
</p>


## 목적
- iTunes API를 활용하여 세로 스크롤뷰 안에 가로 스크롤뷰 구현 연습
- RxSwift와 네트워크 통신 연습

## 사용 기술
- URLSession
- RxSwift
- SnapKit
- ScrollView in ScrollView

## 주요 코드
```
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
```
-> 스크린샷의 개수에 따라 각각의 이미지의 위치를 지정해준 뒤, 마지막 인덱스의 사진의 trailing을 컨텐트뷰의 trailing으로 지정한 후, 이전 인덱스 뒤에 붙여주는 방법을 사용
