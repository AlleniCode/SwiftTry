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

@objcMembers
final class Person: NSObject {
    let first: String
    let last: String
    let yearOfBirth: Int
    
    init(first: String, last: String, yearOfBirth: Int) {
        self.first = first
        self.last = last
        self.yearOfBirth = yearOfBirth
    }
}


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
        
        testSort()
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
    
    
    /// 集合排序
    func testSort() {
        // 1.
        let array = [9, 4, 7, 3]
        let sortedArray = array.sorted()
        print(sortedArray)
        
        let sortedArray1 = array.sorted(by: >)
        print(sortedArray1)
        
        
        // 2.
        var numberStrings = [(2, "Two"), (1, "One"), (3, "Three")]
        numberStrings.sort(by: <)
        print(numberStrings)
        
        
        // 3.
        let animals = ["elephant", "zebra", "dog"]
        let sortedAnimals = animals.sorted { lhs, rhs in
            let l = lhs.reversed()
            let r = rhs.reversed()
            return l.lexicographicallyPrecedes(r)
        }
        print(sortedAnimals)
        
        
        // 4. 排序规则是先按照姓排序，再按照名排序，最后是出生年份
        let people = [
            Person(first: "Emily", last: "Young", yearOfBirth: 2002),
            Person(first: "David", last: "Gray", yearOfBirth: 1991),
            Person(first: "Robert", last: "Barnes", yearOfBirth: 1985),
            Person(first: "Ava", last: "Barnes", yearOfBirth: 2000),
            Person(first: "Joanne", last: "Miller", yearOfBirth: 1994),
            Person(first: "Ava", last: "Barnes", yearOfBirth: 1998),
        ]
        let lastDescriptor = NSSortDescriptor(key: #keyPath(Person.last), ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))
        let firstDescriptor = NSSortDescriptor(key: #keyPath(Person.first), ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))
        let yearDescriptor = NSSortDescriptor(key: #keyPath(Person.yearOfBirth), ascending: true)
        let descriptors = [lastDescriptor, firstDescriptor, yearDescriptor]
        let sortedPeople = (people as NSArray).sortedArray(using: descriptors)
        for p in sortedPeople {
            print((p as! Person).first + " " + (p as! Person).last + " " + String((p as! Person).yearOfBirth))
        }
        
        
        // 5.
        var strings = ["Hello", "hallo", "Hallo", "hello"]
        strings.sort { $0.localizedStandardCompare($1) == .orderedAscending}
        print(strings)
        
        
        // 6.
        var files = ["one", "file.h", "file.c", "test.h"]
        files.sort { l, r in
            r.fileExtension.flatMap {
                l.fileExtension?.localizedStandardCompare($0)
                } == .orderedAscending
        }
        print(files)
        
        
        // 7.
        let sortedPeople1 = people.sorted { p0, p1 in
            let left = [p0.last, p0.first]
            let right = [p1.last, p1.first]
            return left.lexicographicallyPrecedes(right) {
                $0.localizedStandardCompare($1) == .orderedAscending
            }
        }
        for p in sortedPeople1 {
            print(p.first + " " + p.last + " " + String(p.yearOfBirth))
        }
        
        
        // 8. 用别名定义比较 Person 对象的排序描述符
        typealias SortDescriptor<Root> = (Root, Root) -> Bool
        let sortByYear: SortDescriptor<Person> = { $0.yearOfBirth < $1.yearOfBirth }
        let sortByLastName: SortDescriptor<Person> = { $0.last.localizedStandardCompare($1.last) == .orderedAscending }
        
        // key 函数描述了如何深入一个 Root 类型的元素，并提取出一个和特定排序步骤相关的 Value 类型的值。
        func sortDescriptor<Root, Value>(key: @escaping(Root) -> Value, by areInIncreasingOrder: @escaping(Value, Value) -> Bool) -> SortDescriptor<Root> {
            return { areInIncreasingOrder(key($0), key($1)) }
        }
        
        let sortByYearAlt: SortDescriptor<Person> = sortDescriptor(key: { $0.yearOfBirth }, by: <)
        let sortedPeople2 = people.sorted(by: sortByYearAlt)
        for p in sortedPeople2 {
            print(p.first + " " + p.last + " " + String(p.yearOfBirth))
        }
        
        // 还可以为所有实现了 Comparable 的类型定义一个重载版本
        func sortDescriptor1<Root, Value>(key: @escaping(Root) -> Value) -> SortDescriptor<Root> where Value: Comparable {
            return { key($0) < key($1) }
        }
        let sortByYearAlt1: SortDescriptor<Person> = sortDescriptor1(key: { $0.yearOfBirth })
        let sortedPeople3 = people.sorted(by: sortByYearAlt1)
        for p in sortedPeople3 {
            print(p.first + " " + p.last + " " + String(p.yearOfBirth))
        }
        
        func sortDescriptor2<Root, Value>(key: @escaping(Root) -> Value, ascending: Bool = true, by comparator: @escaping(Value) -> (Value) -> ComparisonResult) -> SortDescriptor<Root> {
            return { lhs, rhs in
                let order: ComparisonResult = ascending ? .orderedAscending:.orderedDescending
                return comparator(key(lhs))(key(rhs)) == order
            }
        }
        let sortByFirstName: SortDescriptor<Person> = sortDescriptor2(key: { $0.first }, by: String.localizedStandardCompare)
        let sortedPeople4 = people.sorted(by: sortByFirstName)
        for p in sortedPeople4 {
            print(p.first + " " + p.last + " " + String(p.yearOfBirth))
        }
        
        func combine<Root>(sortDescriptors: [SortDescriptor<Root>]) -> SortDescriptor<Root> {
            return { lhs, rhs in
                for areInIncreasingOrder in sortDescriptors {
                    if areInIncreasingOrder(lhs, rhs) {
                        return true
                    }
                    if areInIncreasingOrder(rhs, lhs) {
                        return false
                    }
                }
                return false
            }
        }
        
        let combined: SortDescriptor<Person> = combine(sortDescriptors: [sortByLastName, sortByFirstName, sortByYear])
        let sortedPeople5 = people.sorted(by: combined)
        for p in sortedPeople5 {
            print(p.first + " " + p.last + " " + String(p.yearOfBirth))
        }
        
        // 自定义运算符
        let combinedAlt = sortByLastName <||> sortByFirstName <||> sortByYear
        let sortedPeople6 = people.sorted(by: combinedAlt)
        for p in sortedPeople6 {
            print(p.first + " " + p.last + " " + String(p.yearOfBirth))
        }
        
        
        // 9.
        func lift<A>(_ compare: @escaping(A) -> (A) -> ComparisonResult) -> (A?) -> (A?) -> ComparisonResult {
            return { lhs in { rhs in
                switch (lhs, rhs) {
                case (nil, nil):
                    return .orderedSame
                case (nil, _):
                    return .orderedAscending
                case (_, nil):
                    return .orderedDescending
                case let (l?, r?):
                    return compare(l)(r)
                }
                }
            }
        }
        let compare = lift(String.localizedStandardCompare)
        let result = files.sorted(by: sortDescriptor2(key: { $0.fileExtension }, by: compare))
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


// 自定义运算符，来合并两个排序函数
infix operator <||> : LogicalDisjunctionPrecedence
func <||><A>(lhs: @escaping (A,A) -> Bool, rhs: @escaping (A,A) -> Bool)
    -> (A,A) -> Bool
{
    return { x, y in
        if lhs(x, y) { return true }
        if lhs(y, x) { return false }
        // 否则，它们就是一样的，所以我们检查第二个条件
        if rhs(x, y) { return true }
        return false
    }
}
