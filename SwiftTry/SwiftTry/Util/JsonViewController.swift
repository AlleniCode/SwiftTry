//
//  JsonViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/27.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_647.html
// https://www.hangge.com/blog/cache/detail_968.html
// https://www.hangge.com/blog/cache/detail_983.html


import UIKit

class JsonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.json()
        
        self.jsonString()
        
        self.testCodingKey()
    }
    
    func json() {
        // Swift 对象
        let user: [String: Any] = ["name": "Allen", "tel": "123456", "age": 18]
        
        // 首先判断能不能转换
        if !JSONSerialization.isValidJSONObject(user) {
            print("is not a valid json object")
            return
        }
        
        // 转成 Data
        let data = try? JSONSerialization.data(withJSONObject: user, options: [])
        
        // 转成 String
        let str = String(data: data!, encoding: .utf8)
        print("Json String：\(str!)")
        
        // 把 Data 对象转换回 JSON 对象
        let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
        print("Json Object：\(json!)")
    }
    
    func jsonString() {
        let string = "[{\"ID\":1,\"Name\":\"元台禅寺\",\"LineID\":1},{\"ID\":2,\"Name\":\"田坞里山塘\",\"LineID\":1},{\"ID\":3,\"Name\":\"滴水石\",\"LineID\":1}]"
        let data = string.data(using: String.Encoding.utf8)
        
        let jsonArray = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
        print(jsonArray!)
    }
    
    func testCodingKey() {
        let json = """
                   {
                      "nick_name": "Allen",
                      "points": 60,
                   }
        """.data(using: .utf8)
        let product = try? JSONDecoder().decode(Product.self, from: json ?? Data())
        print(product!.nickName)
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


struct Product: Codable {
    var nickName: String
    var points: Int
    
    enum CodingKeys: String, CodingKey {
        case nickName = "nick_name"
        case points
    }
}
