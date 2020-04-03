//
//  LibTableViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/2.
//  Copyright © 2020 AAA. All rights reserved.
//

import UIKit

class LibTableViewController: UITableViewController {
    
    var arrayData = ["Realm",
                     "Alamofire & SwiftHTTP",
                     "SwiftyJSON",
                     "LINQ",
                     "SSZipArchive & GzipSwift",
                     "GIF - SwiftGif & YLGIFImage-Swift",
                     "ImageHelper",
                     "SnapKit"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = self.arrayData[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = RealmViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = AlamofireViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = JSONViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = LINQViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = ZipArchiveViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = GIFViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
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
