//
//  SearchBarViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/27.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_562.html
// https://www.hangge.com/blog/cache/detail_797.html


import UIKit

class SearchBarViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let searchBar = UISearchBar(frame: CGRect(x: 30, y: 100, width: UIScreen.main.bounds.width-60, height: 50))
        searchBar.delegate = self
        self.view.addSubview(searchBar)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("开始搜索")
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
