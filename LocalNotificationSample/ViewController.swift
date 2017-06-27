//
//  ViewController.swift
//  LocalNotificationSample
//
//  Created by NanashimaHideyuki on 2017/06/28.
//  Copyright © 2017 jollyjoester. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        
        let content = UNMutableNotificationContent()
        content.title = "title."
        content.body = "body"
        content.sound = UNNotificationSound.default()
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: datePicker.date)

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        let identifier = NSUUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request){
            error in print(error?.localizedDescription ?? "")
        }
    }
}
