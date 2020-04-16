//
//  CollectionViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/27.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_590.html
// https://www.hangge.com/blog/cache/detail_591.html
// https://www.hangge.com/blog/cache/detail_762.html
// https://www.hangge.com/blog/cache/detail_1081.html
// https://www.hangge.com/blog/cache/detail_1090.html
// https://www.hangge.com/blog/cache/detail_1445.html
// https://www.hangge.com/blog/cache/detail_1594.html【动态切换UICollectionView的layout布局】
// https://www.hangge.com/blog/cache/detail_1592.html【带有多section分区的collectionView的使用样例】
// https://www.hangge.com/blog/cache/detail_1591.html【实现表格tableViewCell里嵌套collectionView】
// https://www.hangge.com/blog/cache/detail_1599.html【实现UICollectionView分组头悬停效果（方法1：使用自定义布局）】
// https://www.hangge.com/blog/cache/detail_1600.html【实现UICollectionView分组头悬停效果（方法2：使用iOS9新特性）】
// https://www.hangge.com/blog/cache/detail_1601.html【实现UICollectionView中元素的环形布局】
// https://www.hangge.com/blog/cache/detail_1677.html
// https://www.hangge.com/blog/cache/detail_1678.html
// https://www.hangge.com/blog/cache/detail_1602.html【使用CollectionView实现图片Gallery画廊效果（左右滑动浏览图片）】
// https://www.hangge.com/blog/cache/detail_1605.html【使用CollectionView实现图片Stack层叠效果】
// https://www.hangge.com/blog/cache/detail_1844.html【让CollectionView里的Section分别设置不同的背景色】


import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.view.addSubview(collectionView)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .systemPink
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print(indexPath)
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
