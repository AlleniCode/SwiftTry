//
//  DictionaryViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/24.
//  Copyright © 2020 AAA. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        
        testCreate()
        
        testIterator()
        
        testMap()
        
        testMerge()
        
        testUniqueKeysWithValues()
    }
    
    /// 创建字典
    func testCreate() {
        let dic = [Int: String]()
        print(type(of: dic))
    }
    
    /// 更新字典元素
    func testUpdate() {
        var dic = [1: "1", 2: "2", 3: "3"]
        print(dic)
        
        if let oldValue = dic.updateValue("A", forKey: 1) {
            print(oldValue)
        }
        print(dic)
    }
    
    /// 遍历字典
    func testIterator() {
        let dic = ["A": 1, "B": 2, "C": 3]
        for (key, value) in dic {
            print("\(key) : \(value)")
        }
    }
    
    /// Map
    func testMap() {
        let dic = ["A": 1, "B": 2, "C": 3]
        let result = dic.map { "letter: \($0.key)"}
        print(result)
        
        let result1 = dic.mapValues { $0 + 1} // 返回完整的新的字典
        print(result1)
    }
    
    /// 合并两个字典
    /// Dictionary 有一个 merge(_:uniquingKeysWith:)，它接受两个参数，第一个是要进行合并的键值对，第二个是定义如何合并相同键的两个值的函数。我们可以使用这个方法将一个字典合并至另一个字典中去。
    func testMerge() {
        var dic1 = ["Name": "Allen", "Age": 18, "Sex": true] as [String : Any]
        let dic2 = ["Name": "Allen", "Age": 100, "Sex": true] as [String : Any]
        dic1.merge(dic2, uniquingKeysWith: { $1 })
        print(dic1)
        print(dic2)
    }
    
    /// 从一个 (Key,Value) 键值对的序列中构建一个新的字典。如果我们能能保证键是唯一的，那么就可以使用 Dictionary(uniqueKeysWithValues:)。
    func testUniqueKeysWithValues() {
        let frequencies = "hello".frequencies
        print(frequencies)
        
        let newFrequencies = frequencies.filter { $0.value > 1}
        print(newFrequencies)
    }
    
//    func testMapValues() {
//        var dic = ["Name": "Allen", "Age": 18, "Sex": true] as [String : Any]
//        dic = dic.mapValues { value -> String in
//            switch value {
//            case value is Int:
//                return String(value)
//            case value is Bool:
//                return String(value)
//            default:
//                return value as! String
//
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension Sequence where Element: Hashable {
    var frequencies:[Element: Int] {
        let frequencyPairs = self.map { ($0, 1) }
        return Dictionary(frequencyPairs, uniquingKeysWith: +)
    }
}
