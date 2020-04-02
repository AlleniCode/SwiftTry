//
//  UtilTableViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/24.
//  Copyright © 2020 AAA. All rights reserved.
//

import UIKit

class UtilTableViewController: UITableViewController {

    var arrayData = ["String",
                     "Random",
                     "... & ..<",
                     "File",
                     "EventKit",
                     "JSONSerialization",
                     "Calculation",
                     "Animation",
                     "UserDefaults",
                     "Timer",
                     "Array",
                     "SpriteKit",
                     "Thread & Operation & GCD",
                     "UIDevice",
                     "Socket",
                     "AssetsLibrary",
                     "CoreData",
                     "iCloud",
                     "ImagePicker",
                     "AudioToolbox",
                     "Audio",
                     "Media",
                     "CoreLocation",
                     "Message",
                     "Mail",
                     "Localization",
                     "Regex",
                     "Singleton",
                     "Closure",
                     "Crypto"]
    

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
            let vc = StringViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = RandomViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = RangeViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = FileViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = EventKitViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = JsonViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = CalculationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = AnimationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = UserDefaultViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 9:
            let vc = TimerViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 10:
            let vc = ArrayViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 11:
            let vc = SpriteKit_ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 12:
            let vc = ThreadViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 13:
            let vc = DeviceViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 14:
            let vc = SocketViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 15:
            let vc = AssetsLibraryViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 16:
            let vc = CoreDataViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 17:
            let vc = iCloudViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 18:
            let vc = ImagePickerViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 19:
            let vc = AudioToolboxViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 20:
            let vc = AudioViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 21:
            let vc = MediaViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 22:
            let vc = CoreLocationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 23:
            let vc = MessageViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 24:
            let vc = MailViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 25:
            let vc = LocalizationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 26:
            let vc = RegexViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 27:
            let vc = SingletonViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 28:
            let vc = ClosureViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 29:
            let vc = CryptoViewController()
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
