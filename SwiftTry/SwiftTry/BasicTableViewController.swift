//
//  BasicTableViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/23.
//  Copyright © 2020 AAA. All rights reserved.
//

import UIKit

class BasicTableViewController: UITableViewController {
    
    var arrayData = ["UILabel",
                     "UIButton",
                     "UITextField",
                     "UITextView",
                     "UISwitch",
                     "UISegmentedControl",
                     "UIImageView",
                     "UIProgressView",
                     "UISlider",
                     "UIPickerView",
                     "UIStepper",
                     "UIScrollView",
                     "CoreMotion",
                     "UIGestureRecognizer",
                     "UIDatePicker",
                     "UIToolbar",
                     "UITableView",
                     "UISearchBar",
                     "UICollectionView",
                     "UIPageControl",
                     "UIColor",
                     "UIActivity",
                     "UIAlertController",
                     "UIActivityIndicatorView"]
    

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
            let vc = LabelViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ButtonViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = TextFieldViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = TextViewViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = SwitchViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = SegmentViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = ImageViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = ProgressViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = SliderViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 9:
            let vc = PickerViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 10:
            let vc = StepperViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 11:
            let vc = ScrollViewViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 12:
            let vc = CoreMotionViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 13:
            let vc = GestureViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 14:
            let vc = DatePickerViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 15:
            let vc = ToolbarViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 16:
            let vc = TableViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 17:
            let vc = SearchBarViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 18:
            let vc = CollectionViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 19:
            let vc = PageControlViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 20:
            let vc = ColorViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 21:
            let vc = ActivityViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 22:
            let vc = AlertViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 23:
            let vc = IndicatorViewController()
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
