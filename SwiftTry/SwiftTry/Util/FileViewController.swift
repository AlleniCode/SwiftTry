//
//  FileViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/25.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_527.html

import UIKit

class FileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        self.listFile()
        
        //self.fileExist()

        //self.createFolder()

        //self.createFolder1()

        //self.createFile()

        //self.writeToFile()

        //self.copyFile()

        //self.copyFile1()

        //self.moveFile()

        //self.moveFile2()
    }
    
    /// 遍历一个目录下的所有文件
    func listFile() {
        // 1、获取用户文档目录路径
        let manager = FileManager.default
        let urlForDocument = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urlForDocument.first!
        print(url)
        
        // 2、对指定路径进行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
        let contentsOfPath = try? manager.contentsOfDirectory(atPath: url.path)
        print(contentsOfPath!)
        
        // 3、类似上面的，对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
        let contentsOfURL = try? manager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        print(contentsOfURL!)
        
        // 4、深度遍历，会递归遍历子文件夹（但不会递归符号链接）
        let enumeratorAtPath = manager.enumerator(atPath: url.path)
        print(enumeratorAtPath?.allObjects as Any)
        
        // 5、类似上面的，深度遍历，会递归遍历子文件夹（但不会递归符号链接）
        let enumeratorAtURL = manager.enumerator(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles, errorHandler: nil)
        print(enumeratorAtURL?.allObjects as Any)
        
        // 6、深度遍历，会递归遍历子文件夹（包括符号链接，所以要求性能的话用enumeratorAtPath）
        let subPaths = manager.subpaths(atPath: url.path)
        print(subPaths!)
    }
    
    /// 判断文件或文件夹是否存在
    func fileExist() {
        let manager = FileManager.default
        let filePath: String = NSHomeDirectory() + "/Documents/swift.txt"
        let exist = manager.fileExists(atPath: filePath)
        print(exist)
    }
    
    /// 创建文件夹
    func createFolder() {
        print(NSHomeDirectory())
        let myDirectory = NSHomeDirectory() + "/Documents/MyFolder/Files"
        let fileManager = FileManager.default
        // withIntermediateDirectories 为 ture 表示路径中间如果有不存在的文件夹都会创建
        try! fileManager.createDirectory(atPath: myDirectory, withIntermediateDirectories: true, attributes: nil)
        
        // 检查是否创建成功
        let success = fileManager.fileExists(atPath: myDirectory)
        print(success)
    }
    
    /// 创建文件夹
    func createFolder1() {
        func createFolder(name: String, baseURL: URL) {
            let fileManager = FileManager.default
            let folder = baseURL.appendingPathComponent(name, isDirectory: true)
            print("文件夹：\(folder)")
            let exist = fileManager.fileExists(atPath: folder.path)
            if !exist {
                try! fileManager.createDirectory(atPath: folder.path, withIntermediateDirectories: true, attributes: nil)
            }
        }
        
        // 在文档目录下新建 Folder 目录
        let fileManager = FileManager.default
        let urlForDocument = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urlForDocument.first!
        createFolder(name: "Folder", baseURL: url)
    }
    
    /// 将对象写入文件
    func writeToFile() {
        // 把 String 保存到文件
        func writeString() {
            let filePath = NSHomeDirectory() + "/Documents/test.txt"
            let info = "欢迎来到 hange.com"
            try! info.write(toFile: filePath, atomically: true, encoding: .utf8)
        }
        
        // 把 Image 保存到文件路径下
        func writeData() {
            let filePath = NSHomeDirectory() + "/Documents/swift.png"
            let image = UIImage(named: "swift")
            let data = image?.pngData()
            try! data?.write(to: URL(fileURLWithPath: filePath))
        }
        
        // 把 NSArray 保存到文件路径下
        func writeArray() {
            let filePath = NSHomeDirectory() + "/Documents/array.plist"
            let array = NSArray(objects: "AAA", "BBB", "CCC")
            array.write(toFile: filePath, atomically: true)
        }
        
        // 把 NSDictionary 保存到文件路径下
        func writeDictionary() {
            let filePath = NSHomeDirectory() + "/Documents/dictionary.plist"
            let dictionary:NSDictionary = ["name": "Allen", "age": "18"]
            dictionary.write(toFile: filePath, atomically: true)
        }
        
        writeString()
        writeData()
        writeArray()
        writeDictionary()
    }
    
    /// 创建文件
    func createFile() {
        func createFile(name: String, baseURL: URL) {
            let fileManager = FileManager.default
            let file = baseURL.appendingPathComponent(name)
            print("文件：\(file)")
            let exist = fileManager.fileExists(atPath: file.path)
            if !exist {
                let data = Data(base64Encoded: "ABCDEFG", options: .ignoreUnknownCharacters)
                let success = fileManager.createFile(atPath: file.path, contents: data, attributes: nil)
                print("文件创建结果：\(success)")
            }
        }
        
        // 在文档目录下新建 test.txt 文件
        let fileManager = FileManager.default
        let urlForDocument = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urlForDocument.first!
        createFile(name: "test.txt", baseURL: url)
    }
    
    /// 复制文件
    func copyFile() {
        let fileManager = FileManager.default
        let homeDirectory = NSHomeDirectory()
        let srcUrl = homeDirectory + "/Documents/test.txt"
        let toUrl = homeDirectory + "/Documents/copyed1.txt"
        try! fileManager.copyItem(atPath: srcUrl, toPath: toUrl)
    }
    
    /// 复制文件
    func copyFile1() {
        let fileManager = FileManager.default
        let urlForDocument = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urlForDocument.first!
        let srcUrl = url.appendingPathComponent("test.txt")
        let toUrl = url.appendingPathComponent("copyed2.txt")
        try! fileManager.copyItem(at: srcUrl, to: toUrl)
    }
    
    /// 移动文件
    func moveFile() {
        let fileManager = FileManager.default
        let homeDirectory = NSHomeDirectory()
        let srcUrl = homeDirectory + "/Documents/test.txt"
        let toUrl = homeDirectory + "/Documents/moved/test.txt"
        try! fileManager.moveItem(atPath: srcUrl, toPath: toUrl)
    }
    
    /// 移动文件
    func moveFile2() {
        let manager = FileManager.default
        let urlForDocument = manager.urls( for: .documentDirectory, in:.userDomainMask)
        let url = urlForDocument[0]
         
        let srcUrl = url.appendingPathComponent("test.txt")
        let toUrl = url.appendingPathComponent("moved.txt")
        try! manager.moveItem(at: srcUrl, to: toUrl)
    }
    
    /// 删除文件
    func deleteFile() {
        let fileManager = FileManager.default
        let homeDirectory = NSHomeDirectory()
        let srcUrl = homeDirectory + "/Documents/test.txt"
        try! fileManager.removeItem(atPath: srcUrl)
    }
    
    /// 删除文件
    func deleteFile1() {
        let manager = FileManager.default
        let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
        let url = urlForDocument[0]
        let toUrl = url.appendingPathComponent("copyed.txt")
        try! manager.removeItem(at: toUrl)
    }
    
    /// 删除目录下的所有文件
    func deleteAllFiles() {
        // 获取所有文件，然后遍历删除
        let fileManager = FileManager.default
        let myDirectory = NSHomeDirectory() + "/Documents/Files"
        let fileArray = fileManager.subpaths(atPath: myDirectory)
        for fn in fileArray!{
            try! fileManager.removeItem(atPath: myDirectory + "/\(fn)")
        }
    }
    
    /// 删除目录下的所有文件
    func deleteAllFiles1() {
        // 删除目录后重新创建该目录
        let fileManager = FileManager.default
        let myDirectory = NSHomeDirectory() + "/Documents/Files"
        try! fileManager.removeItem(atPath: myDirectory)
        try! fileManager.createDirectory(atPath: myDirectory, withIntermediateDirectories: true, attributes: nil)
    }
    
    /// 读取文件
    func readFile() {
        let manager = FileManager.default
        let urlsForDocDirectory = manager.urls(for: .documentDirectory, in:.userDomainMask)
        let docPath = urlsForDocDirectory[0]
        let file = docPath.appendingPathComponent("test.txt")
        
        // 方法1
        let readHandler = try! FileHandle(forReadingFrom: file)
        let data = readHandler.readDataToEndOfFile()
        let readString = String(data: data, encoding: .utf8)!
        print("文件内容：\(readString)")
        
        // 方法2
        let data1 = manager.contents(atPath: file.path)!
        let readString1 = String(data: data1, encoding: .utf8)!
        print("文件内容：\(readString1)")
    }
    
    /// 在任意位置写入数据
    func appendDataToFile() {
        let manager = FileManager.default
        let urlsForDocDirectory = manager.urls(for:.documentDirectory, in:.userDomainMask)
        let docPath = urlsForDocDirectory[0]
        let file = docPath.appendingPathComponent("test.txt")
        
        let string = "添加一些文字到文件末尾"
        let appendData = string.data(using: .utf8, allowLossyConversion: true)
        let writeHandler = try? FileHandle(forWritingTo: file)
        writeHandler?.seekToEndOfFile()
        writeHandler?.write(appendData!)
    }
    
    /// 文件权限判断
    func filePromissions() {
        let manager = FileManager.default
        let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
        let docPath = urlForDocument[0]
        let file = docPath.appendingPathComponent("test.txt")
        
        let readable = manager.isReadableFile(atPath: file.path)
        print("可读：\(readable)")
        
        let writable = manager.isWritableFile(atPath: file.path)
        print("可写：\(writable)")
        
        let executable = manager.isExecutableFile(atPath: file.path)
        print("可执行：\(executable)")
        
        let deletable = manager.isDeletableFile(atPath: file.path)
        print("可删除：\(deletable)")
    }
    
    /// 获取文件属性（创建时间，修改时间，文件大小，文件类型等信息）
    func fileAttributes() {
        let manager = FileManager.default
        let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
        let docPath = urlForDocument[0]
        let file = docPath.appendingPathComponent("test.txt")
        
        let attributes = try? manager.attributesOfItem(atPath: file.path)
        print("attributes: \(attributes!)")
        
        /// 从 attributes 中获取具体的属性：
        print("创建时间：\(attributes![FileAttributeKey.creationDate]!)")
        print("修改时间：\(attributes![FileAttributeKey.modificationDate]!)")
        print("文件大小：\(attributes![FileAttributeKey.size]!)")
    }
    
    /// 文件/文件夹比较
    func fileCompare() {
        let manager = FileManager.default
        let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
        let docPath = urlForDocument[0]
        let contents = try! manager.contentsOfDirectory(atPath: docPath.path)
        
        // 下面比较用户文档中前面两个文件是否内容相同（该方法也可以用来比较目录）
        let count = contents.count
        if count > 1 {
            let path1 = docPath.path + "/" + (contents[0] as String)
            let path2 = docPath.path + "/" + (contents[1] as String)
            let equal = manager.contentsEqual(atPath: path1,andPath:path2)
            print("path1：\(path1)")
            print("path2：\(path2)")
            print("比较结果：\(equal)")
        }
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
