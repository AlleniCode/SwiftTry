//
//  CryptoViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/2.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_850.html
// https://www.hangge.com/blog/cache/detail_851.html
// https://www.hangge.com/blog/cache/detail_910.html
// https://www.hangge.com/blog/cache/detail_910.html


import UIKit
import CommonCrypto

class CryptoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        
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
    var md5: String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
         
        CC_MD5(str!, strLen, result)
     
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        //result.deinitialize(count: 1)
         
        return String(format: hash as String)
    }
}
