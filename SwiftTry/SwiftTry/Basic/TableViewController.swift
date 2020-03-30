//
//  TableViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/27.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_552.html
// https://www.hangge.com/blog/cache/detail_557.html
// https://www.hangge.com/blog/cache/detail_558.html
// https://www.hangge.com/blog/cache/detail_559.html
// https://www.hangge.com/blog/cache/detail_560.html
// https://www.hangge.com/blog/cache/detail_561.html
// https://www.hangge.com/blog/cache/detail_714.html


import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView?
    var arrayData: [Array<String>]?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.arrayData = []
        for group in 1...2 {
            var array: [String] = []
            for i in 1...10 {
                array.append(String("第 \(group) 组 - 第 \(i) 行"))
            }
            self.arrayData?.append(array)
        }
        
        
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        self.tableView?.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arrayData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String("第 \(section+1) 组组头")
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return String("共 \(self.arrayData?[section].count) 条数据")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = self.arrayData?[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView?.deselectRow(at: indexPath, animated: true)
        
        print("你选中了: \(String(describing: self.arrayData?[indexPath.section][indexPath.row]))")
    }
    
    /// 滑动删除必须实现的方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("删除 \(indexPath)")
        
        self.arrayData?[indexPath.section].remove(at: indexPath.row)
        self.tableView?.deleteRows(at: [indexPath], with: .fade)
    }
    
    /// 滑动删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    /// 修改删除按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    /// 设置cell的显示动画
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 设置cell的显示动画为3D缩放
        // xy方向缩放的初始值为0.1
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        // 设置动画时间为0.25秒，xy方向缩放的最终值为1
        UIView.animate(withDuration: 0.25) {
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
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
