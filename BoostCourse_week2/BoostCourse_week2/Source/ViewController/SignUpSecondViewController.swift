//
//  SignUpSecondViewController.swift
//  BoostCourse_week2
//
//  Created by 김승찬 on 2021/07/30.
//

import UIKit

class SignUpSecondViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    let dateFormmater: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM//dd"
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerAction()
        
    
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
            
            let date: Date = self.datePicker.date
            let dateString: String = self.dateFormmater.string(from: date)
            
            self.dateLabel.text = dateString
    }

   // 바뀌었을 때 ValueChange
    
    private func datePickerAction() {
        
        self.datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
      
    }
}
