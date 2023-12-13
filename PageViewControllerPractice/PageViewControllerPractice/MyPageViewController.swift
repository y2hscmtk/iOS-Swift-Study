//
//  MyPageViewController.swift
//  PageViewControllerPractice
//
//  Created by Choi76 on 2023/12/13.
//

import UIKit


class MyPageViewController: UIPageViewController {
    
    // 서버로부터 받아온 데이터(가정)
    var pageContents: [String] = ["페이지 내용1", "페이지 내용2", "페이지 내용3"]
    var currentIndex: Int = 0 // 현재 인덱스
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self // 자기 자신을 datasource로 설정
        
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    
    // 새로운 뷰 컨트롤러 인스턴스를 생성 => PageContentViewController(보여줄 뷰) 리턴
    func contentViewController(at index: Int) -> PageContentViewController? {
        // 유효성 검사
        if index < 0 || index >= pageContents.count {
            return nil
        }

        // 스토리보드에서 뷰 컨트롤러 인스턴스를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "PageContentViewController") as? PageContentViewController {
            pageContentViewController.pageText = pageContents[index] // 새로운 페이지에 값 할당
            pageContentViewController.pageIndex = index // 새로운 페이지의 인덱스 설정
            return pageContentViewController // 생성한 페이지 리턴
        }

        return nil
    }
    
}

// UIPageViewController 확장
extension MyPageViewController : UIPageViewControllerDataSource{
    
    // <<이전>>
    // 우측 -> 좌측 이동시 보여줄 VC를 리턴
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // 현재 페이지의 인덱스 번호 받아오기
        var index = (viewController as! PageContentViewController).pageIndex

        // 0번째 인덱스라면 아무런 동작이 없도록
        if index == 0 {
            return nil
        }

        index -= 1 // 이전 화면으로 이동했으므로 인덱스 -1
        return contentViewController(at: index) // 페이지 리턴
    }
    
    // <<이후>>
    // 좌측 -> 우측 이동시 보여줄 VC를 리턴
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // 현재 페이지의 인덱스 번호
        var index = (viewController as! PageContentViewController).pageIndex
        
        // 갖고 있는 데이터를 초과하지 않는지 확인
        if index == pageContents.count {
            return nil // 마지막 페이지에 도달한 경우, 페이지를 넘길 수 없음
        }
        
        index += 1 // 다음 화면으로 이동했으므로 인덱스 +1
        return contentViewController(at: index) // 페이지 리턴
    }
    
}
