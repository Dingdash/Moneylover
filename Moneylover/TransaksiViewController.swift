//
//  TransaksiViewController.swift
//  Moneylover
//
//  Created by DaFIDS on 10/05/18.
//  Copyright © 2018 DaFIDS. All rights reserved.
//

import UIKit
import MonthYearPicker
import Alamofire
import Foundation
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
    func addTransaction(id_category:Int,id_wallet_user:String,with_name:String,note:String,nominal:String,complete:@escaping (_ status:Int,_ message:String)->Void){
        let body = ["id_category": id_category,"id_wallet_user":id_wallet_user,"with_name":with_name,"note":note,"nominal":nominal] as [String : Any]
        Alamofire.request(Config.base_url+Config.getAPI(jenis: "transaction"), method: .post, parameters: body, headers: nil) .responseJSON { (response) in
            if let json : [String : Any] = response.result.value as?[String:Any] {
                let message=json["message"].unsafelyUnwrapped as!String
                let status = json["status"].unsafelyUnwrapped as!Int
                // print(json["status"].unsafelyUnwrapped)//0 username password salah//1 login benar
                //status = json["status"].unsafelyUnwrapped as! Int
                print(status)
                
                
                complete(status,message)
            }
        }
    }
    func addWallet(wallet_name:String,complete:@escaping (_ status:Int,_ message:String)->Void){
        let body = ["walletname":wallet_name]
        Alamofire.request(Config.base_url+Config.getAPI(jenis: "wallet"), method: .post, parameters: body, headers: nil) .responseJSON { (response) in
            if let json : [String : Any] = response.result.value as?[String:Any] {
                let message=json["message"].unsafelyUnwrapped as!String
                let status = json["status"].unsafelyUnwrapped as!Int
                // print(json["status"].unsafelyUnwrapped)//0 username password salah//1 login benar
                //status = json["status"].unsafelyUnwrapped as! Int
                print(status)
                
                
                complete(status,message)
            }
        }
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
