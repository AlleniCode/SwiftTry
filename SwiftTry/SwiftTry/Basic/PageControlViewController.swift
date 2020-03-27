//
//  PageControlViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/27.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_604.html

import UIKit

class PageControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let pageControl = UIPageControl()
        pageControl.center = self.view.center
        pageControl.pageIndicatorTintColor = .systemBlue
        pageControl.currentPageIndicatorTintColor = .systemPink
        pageControl.numberOfPages = 10
        pageControl.currentPage = 3
        pageControl.addTarget(self, action: #selector(pageChanged), for: .valueChanged)
        self.view.addSubview(pageControl)
    }
    
    @objc func pageChanged(_ sender: UIPageControl) {
        print(sender.currentPage)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
