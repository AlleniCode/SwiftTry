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
                     "SnapKit",
                     "ijkplayer",
                     "SwiftSocket & sockets",
                     "XCGLogger",
                     "CVCalendar",
                     "GCDWebServer",
                     "ObjectMapper",
                     "BTNavigationDropdownMenu 导航栏下拉菜单",
                     "PagingMenuController 分页菜单",
                     "SCLAlertView",
                     "CryptoSwift",
                     "SwipeCellKit",
                     "RxSwift",
                     "MBProgressHUD",
                     "Charts",
                     "SwiftDate",
                     "PromiseKit",
                     "AAInfographics",
                     "SideMenu"]

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
        case 6:
            let vc = ImageHelperViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = SnapKitViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = IjkplayerViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 9:
            let vc = SwiftSocketViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 10:
            let vc = XCGLoggerViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 11:
            let vc = CVCalendarViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 12:
            let vc = GCDWebServerViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 13:
            let vc = ObjectMapperViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 14:
            let vc = BTNavigationDropdownMenuViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 15:
            let vc = PagingMenuControllerViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 16:
            let vc = SCLAlertViewViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 17:
            let vc = CryptoSwiftViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 18:
            let vc = SwipeCellKitViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 19:
            let vc = RxSwiftViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 20:
            let vc = MBProgressHUDViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 21:
            let vc = ChartsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 22:
            let vc = SwiftDateViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 23:
            let vc = PromiseKitViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 24:
            let vc =  AAInfographicsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 25:
            let vc = SideMenuViewController()
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
