//
//  TransaksiViewController.swift
//  Moneylover
//
//  Created by DaFIDS on 10/05/18.
//  Copyright © 2018 DaFIDS. All rights reserved.
//

import UIKit
import MonthYearPicker
class TransaksiViewController: UIViewController {

    @IBOutlet weak var datePicker1: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let picker = MonthYearPickerView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: view.bounds.width, height: 200)))
        picker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        view.addSubview(picker)
               // Do any additional setup after loading the view.
    }
    @objc func dateChanged(_ picker: MonthYearPickerView) {
        print("date changed: \(picker.date)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
