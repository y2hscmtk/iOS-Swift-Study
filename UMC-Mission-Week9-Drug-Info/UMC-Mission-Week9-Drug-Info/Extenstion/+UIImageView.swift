//
//  +UIImageView.swift
//  UMC-Mission-Week9-Drug-Info
//
//  Created by Choi76 on 2023/12/10.
//

import Foundation
import UIKit

class Cache {
    static let imageCache = NSCache<NSString, UIImage>()
}

// 이미지뷰에 다운로드 링크를 통한 이미지 다운로드 확장
extension UIImageView {
    func imageDownload(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        // 링크 문자열을 URL로 변환
        guard let url = URL(string: link) else {
            return
        }
        // 캐시에서 이미지 확인 => 저장된 이미지가 있다면 새롭게 다운로드하지 않음
        if let cacheImage = Cache.imageCache.object(forKey: url.absoluteString as NSString) {
            DispatchQueue.main.async() { [weak self] in
                self?.contentMode = mode
                self?.image = cacheImage
            }
        }
        else {
            // dataTask 방식은 모리에 데이터를 직접 로드하기 때문에, 링크를 동안 다운로드에 제약이 있을 수 있다.
            // => downloadTask로 수정
            URLSession.shared.downloadTask(with: url) { localURL, response, error in
                if let localURL = localURL, let data = try? Data(contentsOf: localURL), let image = UIImage(data: data) {
                    DispatchQueue.main.async() { [weak self] in
                        Cache.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                        self?.contentMode = mode
                        self?.image = image
                    }
                } else {
                    DispatchQueue.main.async {
                        print("Download image fail : \(url)")
                    }
                }
            }.resume()
        }
    }

}
