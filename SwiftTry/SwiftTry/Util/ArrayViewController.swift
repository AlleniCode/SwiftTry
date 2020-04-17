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
        
        
        
        testMutable()
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
