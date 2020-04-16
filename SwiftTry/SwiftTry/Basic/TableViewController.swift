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
// https://www.hangge.com/blog/cache/detail_716.html
// https://www.hangge.com/blog/cache/detail_721.html
// https://www.hangge.com/blog/cache/detail_724.html
// https://www.hangge.com/blog/cache/detail_727.html
// https://www.hangge.com/blog/cache/detail_749.html
// https://www.hangge.com/blog/cache/detail_750.html
// https://www.hangge.com/blog/cache/detail_751.html
// https://www.hangge.com/blog/cache/detail_752.html
// https://www.hangge.com/blog/cache/detail_934.html
// https://www.hangge.com/blog/cache/detail_935.html
// https://www.hangge.com/blog/cache/detail_936.html
// https://www.hangge.com/blog/cache/detail_966.html
// https://www.hangge.com/blog/cache/detail_1040.html
// https://www.hangge.com/blog/cache/detail_1062.html
// https://www.hangge.com/blog/cache/detail_1175.html
// https://www.hangge.com/blog/cache/detail_1320.html
// https://www.hangge.com/blog/cache/detail_1254.html
// https://www.hangge.com/blog/cache/detail_1341.html
// https://www.hangge.com/blog/cache/detail_1342.html
// https://www.hangge.com/blog/cache/detail_1343.html
// https://www.hangge.com/blog/cache/detail_1391.html
// https://www.hangge.com/blog/cache/detail_1392.html
// https://www.hangge.com/blog/cache/detail_1387.html
// https://www.hangge.com/blog/cache/detail_1406.html【MJRefresh库的使用详解1（配置，及库自带的下拉刷新组件）】
// https://www.hangge.com/blog/cache/detail_1408.html【MJRefresh库的使用详解2（创建自定义的下拉刷新组件）】
// https://www.hangge.com/blog/cache/detail_1407.html【MJRefresh库的使用详解3（库自带的上拉加载组件）】
// https://www.hangge.com/blog/cache/detail_1409.html【MJRefresh库的使用详解4（创建自定义的上拉加载组件）】
// https://www.hangge.com/blog/cache/detail_1410.html【MJRefresh库的使用详解5（CollectionView上实现上拉下拉刷新）】
// https://www.hangge.com/blog/cache/detail_1414.html【MJRefresh库的使用详解6（WebView上实现下拉刷新）】
// https://www.hangge.com/blog/cache/detail_1415.html【MJRefresh库的使用详解7（ScrollView上实现上拉下拉刷新）】
// https://www.hangge.com/blog/cache/detail_1383.html
// https://www.hangge.com/blog/cache/detail_1432.html
// https://www.hangge.com/blog/cache/detail_1499.html
// https://www.hangge.com/blog/cache/detail_1500.html
// https://www.hangge.com/blog/cache/detail_1546.html
// https://www.hangge.com/blog/cache/detail_1598.html
// https://www.hangge.com/blog/cache/detail_1665.html
// https://www.hangge.com/blog/cache/detail_1720.html【SwiftForms的使用详解（第三方Form表单组件 ）】
// https://www.hangge.com/blog/cache/detail_1813.html【表格section header增加滑动删除功能（删除该分区下所有cell）】
// https://www.hangge.com/blog/cache/detail_1888.html【自定义tableViewCell滑动事件按钮1】
// https://www.hangge.com/blog/cache/detail_1891.html【自定义tableViewCell滑动事件按钮2】
// https://github.com/SwipeCellKit/SwipeCellKit
// https://www.hangge.com/blog/cache/detail_1874.html【单元格滑动按钮库SwipeCellKit使用详解1（基本用法）】
// https://www.hangge.com/blog/cache/detail_1892.html【】
// https://www.hangge.com/blog/cache/detail_1893.html【单元格滑动按钮库SwipeCellKit使用详解3（自动扩展样式）】
// https://www.hangge.com/blog/cache/detail_2194.html【给tableView中的单元格设置左右边距（margin left、margin right）】
// https://www.hangge.com/blog/cache/detail_2176.html【实现tableView中section分组圆角效果1（没有分区头、尾的情况）】
// https://www.hangge.com/blog/cache/detail_2195.html【实现tableView中section分组圆角效果2（含有分区头、尾的情况）】
// https://www.hangge.com/blog/cache/detail_2258.html【两个 tableView 间联动功能的实现（左侧分类列表，右侧商品列表）】
// https://www.hangge.com/blog/cache/detail_2259.html【tableView与collectionView联动功能的实现（左侧大分类，右侧小分类）】
// https://www.hangge.com/blog/cache/detail_2271.html【实现下拉时背景图片放大效果（仿QQ个人资料页面）】
// https://www.hangge.com/blog/cache/detail_2276.html【设置表格cell的分隔线边距（分割线与边框距离）】


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
