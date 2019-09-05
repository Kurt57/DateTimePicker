//
//  ViewController.swift
//  DateTimePicker
//
//  Created by Huong Do on 9/16/16.
//  Copyright © 2016 ichigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DateTimePickerDelegate {
    
    @IBAction func showDateTimePicker(sender: AnyObject) {
        let min = Date().addingTimeInterval(-60 * 60 * 24 * 6000)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 4000)
        var exludes =  [Date]()
        for i in  -5 ... -4 {
            let exlude = Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * i))
            exludes.append(exlude)
        }

        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max, exludeDates: exludes)
        
        // customize your picker
//        picker.timeInterval = DateTimePicker.MinuteInterval.thirty
//        picker.locale = Locale(identifier: "en_GB")
//
//        picker.todayButtonTitle = "Today"
//        picker.is12HourFormat = true
//        picker.dateFormat = "hh:mm aa dd/MM/YYYY"
//        picker.isTimePickerOnly = true
//        picker.isDatePickerOnly = true
//        picker.includeMonth = true // if true the month shows at bottom of date cell
//        picker.highlightColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
//        picker.darkColor = UIColor.darkGray
//        picker.doneButtonTitle = "!! DONE DONE !!"
//        picker.doneBackgroundColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
//        picker.dateFormat = "dd.MM.YYYY hh:mm aa"
        picker.completionHandler = { date in
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.YYYY hh:mm aa"
            self.title = formatter.string(from: date)
        }
        picker.delegate = self
        
        // add picker to your view
        // don't try to make customize width and height of the picker,
        // you'll end up with corrupted looking UI
//        picker.frame = CGRect(x: 0, y: 100, width: picker.frame.size.width, height: picker.frame.size.height)
        // set a dismissHandler if necessary
//        picker.dismissHandler = {
//            picker.removeFromSuperview()
//        }
//        self.view.addSubview(picker)
        
        // or show it like a modal
        picker.show()
    }
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        title = picker.selectedDateString
    }
}
