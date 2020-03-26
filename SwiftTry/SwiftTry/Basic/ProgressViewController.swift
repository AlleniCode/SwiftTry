//
//  ProgressViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_535.html

import UIKit

class ProgressViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.center = self.view.center
        progressView.progressTintColor = .systemBlue
        progressView.trackTintColor = .systemYellow
        progressView.progress = 0.3
        progressView.setProgress(0.8, animated: true)
        self.view.addSubview(progressView)
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