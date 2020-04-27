//
//  SetViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/15.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_1840.html

import UIKit

class SetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        testSet()
        testSetSub()
        testUnion()
        testIndexSet()
        testCharacterSet()
        testUnique()
    }
    
    /// 用数组字面量的方式初始化一个集合
    func testSet() {
        let set: Set = [1, 2, 3, 3, 2, 1]
        print(set)
        print(set.contains(0))
        print(set.contains(1))
    }
    
    /// 集合的补集
    func testSetSub() {
        let iPods: Set = ["iPod touch", "iPod nano", "iPod mini", "iPod shuffle", "iPod Classic"]
        let discontinuedIPods: Set = ["iPod mini", "iPod Classic", "iPod nano", "iPod shuffle"]
        let currentIPods = iPods.subtracting(discontinuedIPods)
        print(currentIPods)
        // ["iPod touch"]
    }
    
    /// 集合的并集
    func testUnion() {
        let set1: Set = ["A", "B", "C", "D", "E"]
        var set2: Set = ["a", "b", "c", "d", "e"]
        set2.formUnion(set1)
        print(set2)
    }
    
    /// 索引集合
    func testIndexSet() {
        var indices = IndexSet()
        indices.insert(integersIn: 1..<5)
        indices.insert(integersIn: 11..<15)
        let evenIndices = indices.filter { $0 % 2 == 0 }
        print(evenIndices)
    }
    
    /// 字符集合
    func testCharacterSet() {
        var set = CharacterSet()
        //set.insert(charactersIn: "a"..."z")
        //set.insert(charactersIn: "A"..."Z")
        set.insert(charactersIn: "ABC")
        print(set)
    }
    
    /// 去除重复元素
    func testUnique() {
        let result = [1, 2, 3, 4, 5, 5, 4, 3, 2, 1].unique()
        print(result)
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

/// 这个方法让我们可以找到序列中的所有不重复的元素，并且通过元素必须满足 Hashable 这个约束来维持它们原来的顺序。
extension Sequence where Element: Hashable {
    func unique() -> [Element] {
        var seen: Set<Element> = []
        return filter { element in
            if seen.contains(element) {
                return false
            } else {
                seen.insert(element)
                return true
            }
        }
    }
}
