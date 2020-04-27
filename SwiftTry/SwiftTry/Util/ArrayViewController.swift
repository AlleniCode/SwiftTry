//
//  ArrayViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/1.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_723.html
// https://www.hangge.com/blog/cache/detail_2171.html


import UIKit

class ArrayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        /// map：对每个元素进行转换并返回新的集合对象。
        /// filter：可设置过滤条件闭包，将符合条件的元素返回新集合对象。
        /// reduce：也叫“累加器”，通过闭包操作元素返回一个值。
        /// sorted：根据闭包对元素排序，返回排序好的新集合对象。
        /// flatMap：二维数组经过 flatMap 会降到一维数组，并且过滤掉 nil 值。
        
        
        var userList = [UserInfo]()
        userList.append(UserInfo(name: "张三", phone: "4234"))
        userList.append(UserInfo(name: "李四", phone: "1212"))
        userList.append(UserInfo(name: "航歌", phone: "3525"))
        
        func onSort(s1:UserInfo, s2:UserInfo) -> Bool{
            return s1.name > s2.name
        }
        let result = userList.sorted(by: onSort(s1:s2:))
        print(result)
        
        userList.sort(by: {$0.name > $1.name})
        print(userList)
        
        
        testCreat()
        testAddElement()
        
        testCount()
        testMutable()
        testIndex()
        testTraverse()
        testMap()
        testFlatMap()
        
        testSequence()
        
        testSplit()
        
        testAccumulate()
        
        testFilter()
        
        testReduce()
        
        testStrongWeak()
    }
    
    /// 创建数组
    func testCreat() {
        let nums = [Int]()
        print(type(of: nums))
        
        let nums1: [Int]
        print(type(of: nums1))
        
        let nums2 = [1, 2, 3]
        print(nums2)
    }
    
    /// 向数组中添加、删除元素
    func testAddElement() {
        var nums = [Int]()
        
        nums.append(1)
        print(nums)
        
        nums.append(contentsOf: [2, 3, 4])
        print(nums)
        
        nums += [5]
        print(nums)
        
        nums += [6, 7, 8]
        print(nums)
        
        nums.insert(0, at: 0)
        print(nums)
        
        nums.remove(at: 0)
        print(nums)
        
        nums.removeLast()
        print(nums)
    }
    
    /// 数组元素个数
    func testCount() {
        var array = Array<Any>()
        print(array.isEmpty)
        print(array.count)
        
        array = ["A", "B", "C"]
        print(array.isEmpty)
        print(array.count)
    }
    
    /// 数组可变性
    func testMutable() {
        let array = [1, 2, 3]
        var array1 = array
        array1.append(4)
        
        print(array)   // array 没变
        // [1, 2, 3]
        print(array1)  // array1 变化了
        // [1, 2, 3, 4]
        
        array1[0] = 0
        print(array1)
        
        array1[1...3] = [22, 33, 44] // 使用下标改变多个元素
        print(array1)
    }
    
    /// 数组索引
    func testIndex() {
        let array = ["A", "B", "C"]
        print(array[1])
    }
    
    /// 数组遍历
    func testTraverse() {
        let array = ["A", "B", "C"]
        
        for element in array {
            print(element)
        }
        
        for element in array.dropFirst() {
            print(element)
        }
        
        for element in array.dropFirst(2) {
            print(element)
        }
        
        for element in array.dropLast() {
            print(element)
        }
        
        for element in array.dropLast(2) {
            print(element)
        }
        
        for (index, element) in array.enumerated() {
            print(String(index) + ":" + element)
        }
    }
    
    /// 使用 forEach 进行迭代
    func testForEach() {
        let array = [1, 2, 3]
        
        array.forEach { (element) in
            print(element)
        }
    }
    
    /// 数组变形
    /// map 就像是一个信号，一旦你看到它，就会知道即将有一个函数被作用在数组的每个元素上，并返回另一个数组，它将包含所有被转换后的结果。
    func testMap() {
        let array = [1, 2, 3, 4, 5]
        let newArray = array.map { x in
            x * x
        }
        print(newArray)
    }
    /**
     extension Array {
         func map<T>(_ transform: (Element) -> T) -> [T] {
             var result: [T] = []
             result.reserveCapacity(count)
             for x in self {
                 result.append(transform(x))
             }
             return result
         }
     }
     */
    
    func testFlatMap() {
        let suits = ["♠︎", "♥︎", "♣︎", "♦︎"]
        let ranks = ["J", "Q", "K", "A"]
        let result = suits.flatMap { suit in
            ranks.map { rank in
                (suit, rank)
            }
        }
        print(result)
    }
    
    
    /// reserveCapacity
    /// 如果明确的知道一个数组的容量大小，可以调用这个方法告诉系统这个数组至少需要的容量，避免在数组添加元素过程中重复的申请内存。
    func testReserveCapacity() {
        var array = [String]()
        array.reserveCapacity(10)
    }
    
    /// lexicographicallyPrecedes
    /// lexicographic 是词典的意思。这个方法声明在 AnyCollection 里。会按照顺序比较两个集合元素的大小。
    /// 比如下面代码展示了如何比较两个字符串版本号的大小：
    func testLexicographicallyPrecedes() {
        let storeVersion = "3.14.10"
        let currentVersion = "3.130.10"
        
        let result = storeVersion.versionToInt().lexicographicallyPrecedes(currentVersion.versionToInt())
        print(result)
    }
    
    /// partition
    /// partition 会根据条件把集合里的元素重新排序，符合条件的元素移动到最后，返回一个两个部分分界元素的索引。
    /// 再通过 prefix 和 suffix 可以分别获得集合的两段元素。
    func testPartition() {
        var numbers = [30, 40, 20, 30, 30, 60, 10]
        let p = numbers.partition(by: { $0 > 30 })
        print(p)
        print(numbers)
        // p == 5
        // numbers == [30, 10, 20, 30, 30, 60, 40]

        let head = numbers.prefix(upTo: p)
        print(head)
        // head == [30, 10, 20, 30, 30]
        
        let end = numbers.suffix(from: p)
        print(end)
        // end == [60, 40]
    }
    
    /// sequence(first: next: )
    /// 根据next里的闭包来生成下一个元素，和reduce完全相反。特别的是这个函数返回的是一个 UnfoldSequence ，即里面的值是lazy的，只要在访问时才生成，这也可能是一个无限的队列。
    func testSequence() {
        for x in sequence(first: 0.1, next: { $0 * 2}).prefix(while: { $0 < 4}) {
            print(x)
        }
        // 0.1, 0.2, 0.4, 0.8, 1.6, 3.2
    }
    /// 似乎特别适合用来寻祖，当next闭包返回的是nil时队列就终止了：
    /*
    for view in sequence(first: someView, next: { $0.superview }) {
        // someView, someView.superview, someView.superview.superview, ...
    }
    */
    
    /// elementsEqual
    /// 用来判断两个队列的是否拥有相同的元素，并且顺序是一致的
    func testElementsEqual() {
        let a = 1...3
        let b = 1...10
         
        print(a.elementsEqual(b))
        print(a.elementsEqual([1, 2, 3]))
    }
    
    /// 数组元素拆分
    /**
     let array: [Int] = [1, 2, 2, 2, 3, 4, 4]
     var result: [[Int]] = array.isEmpty ? [] : [[array[0]]]
     for (previous, current) in zip(array, array.dropFirst()) {
         if previous == current {
             result[result.endIndex-1].append(current)
         } else {
             result.append([current])
         }
     }
     result // [[1], [2, 2, 2], [3], [4, 4]]
     */
    func testSplit() {
        let array: [Int] = [1, 2, 2, 2, 3, 4, 4]

        let parts = array.split { $0 != $1 }
        print(parts)
        
        let parts1 = array.split(where: !=)
        print(parts1)
    }
    
    func testAccumulate() {
        let array = [1, 2, 3, 4, 5]
        let result = array.accumulate(0, +)
        print(result)
    }
    
    func testFilter() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = numbers.filter { $0 % 2 == 0}
        print(result)
    }
    
    func testReduce() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = numbers.reduce(0, +)
        print(result)
        
        let strResult = numbers.reduce("") { str, num in
            str + "\(num),"
        }
        print(strResult)
    }
    
    /// 强弱引用
    func testStrongWeak() {
        let strongArray = NSPointerArray.strongObjects()
        print(strongArray)
        
        let weakArray = NSPointerArray.weakObjects()
        print(weakArray)
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

extension String {
    func versionToInt() -> [Int] {
        return self.components(separatedBy: ".")
            .map { Int.init($0) ?? 0 }
    }
}

extension Array {
    func split(where condition: (Element, Element) -> Bool) -> [[Element]] {
        var result: [[Element]] = self.isEmpty ? [] : [[self[0]]]
        for (previous, current) in zip(self, self.dropFirst()) {
            if condition(previous, current) {
                result.append([current])
            } else {
                result[result.endIndex-1].append(current)
            }
        }
        return result
    }
}

extension Array {
    func accumulate<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> [Result] {
        var running = initialResult
        return map { next in
            running = nextPartialResult(running, next)
            return running
        }
    }
}
