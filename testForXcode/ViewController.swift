//
//  ViewController.swift
//  testForXcode
//
//  Created by LLN on 15/4/21.
//  Copyright (c) 2015年 LLN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var height: UISlider!
    @IBOutlet weak var heightView: UILabel!
    @IBOutlet weak var house: UISwitch!
    @IBOutlet weak var show: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        name.resignFirstResponder()
        //点击屏幕任意位置，关闭小键盘
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func heightChanged(sender: AnyObject) {
        var slider = sender as! UISlider
        var i = Int(slider.value)
        heightView.text = "\(i)cm"

    }
    @IBAction func ensure(sender: AnyObject) {
        var genderText = "同志"
        if gender.selectedSegmentIndex==0
        {
            genderText = "女士"
        }
        else
        {
              genderText = "先生"
        }
        let houseText = house.on ? "有房": "没房"
        let gregorian = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)
        let now = NSDate()
        let compents = gregorian?.components(NSCalendarUnit.YearCalendarUnit, fromDate: birthday.date, toDate:now, options: NSCalendarOptions(0))
        let age = compents?.year
        show.text = "你好,\(name.text),\(genderText),\(age!)岁,\(heightView.text!),\(houseText)"


}
}