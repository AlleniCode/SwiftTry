//
//  EventKitViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/27.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_644.html
// https://www.hangge.com/blog/cache/detail_1311.html
// https://www.hangge.com/blog/cache/detail_1312.html
// https://www.hangge.com/blog/cache/detail_1385.html


import UIKit
import EventKit

class EventKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let eventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event, completion: { granted, error in
            if (granted) && (error == nil) {
                // 新建一个事件
                let event = EKEvent(eventStore: eventStore)
                event.title = "新增一个测试事件"
                event.startDate = Date()
                event.endDate = Date()
                event.notes = "这是个备注"
                event.calendar = eventStore.defaultCalendarForNewEvents
                
                do {
                    try eventStore.save(event, span: .thisEvent)
                    print("Saved Event")
                } catch {
                    print("Saved Error")
                }
                
                // 获取本地日历（剔除节假日，生日等其他系统日历）
                let canlendars = eventStore.calendars(for: .event).filter { (calendar) -> Bool in
                    return calendar.type == .local || calendar.type == .calDAV
                }
                
                // 获取所有的事件（前后90天）
                let startDate = Date().addingTimeInterval(-3600*24*90)
                let endDate = Date().addingTimeInterval(3600*24*90)
                let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: canlendars)
                print("查询范围 开始:\(startDate) 结束:\(endDate)")
                
                if let ev = eventStore.events(matching: predicate) as [EKEvent]? {
                    for i in ev {
                        print("标题  \(String(describing: i.title))")
                        print("开始时间: \(String(describing: i.startDate))")
                        print("结束时间: \(String(describing: i.endDate))")
                    }
                }
            }
        })
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
