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
                     "JSONSerialization"]
    

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
