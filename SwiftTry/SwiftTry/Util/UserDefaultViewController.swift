//
//  UserDefaultViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/30.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_668.html
// https://www.hangge.com/blog/cache/detail_719.html

import UIKit

class UserDefaultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let uuid = self.getUUID()
        print(uuid)
        
        self.funcModel()
    }
    
    func getUUID() -> String {
        let uuid = UserDefaults.standard.string(forKey: "uuid_key")
        if uuid != nil {
            return uuid!
        } else {
            let uuid_ref = CFUUIDCreate(nil)
            let uuid_string_ref = CFUUIDCreateString(nil, uuid_ref)
            let uuid_new = uuid_string_ref! as String
            UserDefaults.standard.set(uuid_new, forKey: "uuid_key")
            UserDefaults.standard.synchronize()
            return uuid_new
        }
    }
    
    /// 自定义对象的存储和读取
    func funcModel() {
        
        func saveModel() {
            let user = UserInfo(name: "Allen", phone: "123456")
            let data = try? NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: "userinfo_key")
            UserDefaults.standard.synchronize()
        }
        
        func getModel() {
            let data = UserDefaults.standard.value(forKey: "userinfo_key")
            let user = try? (NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data as! Data) as! UserInfo)
            if user != nil {
                print(user!.name)
                print(user!.phone)
            } else {
                print("no user")
            }
        }
        
        func deleteModel() {
            UserDefaults.standard.removeObject(forKey: "userinfo_key")
            UserDefaults.standard.synchronize()
        }
        
        saveModel()
        getModel()
        deleteModel()
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


class UserInfo: NSObject, NSCoding {
    var name: String
    var phone: String
    
    init(name: String = "", phone: String = "") {
        self.name = name
        self.phone = phone
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "name") as! String
        self.phone = coder.decodeObject(forKey: "phone") as! String
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "name")
        coder.encode(self.phone, forKey: "phone")
    }
}
