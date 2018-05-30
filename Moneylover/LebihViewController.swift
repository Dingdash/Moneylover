//
//  LebihViewController.swift
//  Moneylover
//
//  Created by DaFIDS on 10/05/18.
//  Copyright © 2018 DaFIDS. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
class LebihViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var emailText: UILabel!
    let cellContent = ["Dompet Saya","Kategori","Hutang","Alat","Mode Perjalanan","Toko","Jelajahi Money Lover","Tentang"]
    var indexview=0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "LebihCell")
        cell.textLabel?.text = cellContent[indexPath.row]
        return cell
    }
    func getWallet(complete:@escaping(_ result:[[String:Any]]?)->Void){
        let header = ["token":Config.token]
        Alamofire.request(Config.base_url+Config.getAPI(jenis: "wallet"), method:.get, parameters: nil,encoding:JSONEncoding.default,headers:header).responseJSON{response in
            //print(response.result.value)
            if let json : [String : Any] = response.result.value as?[String:Any] {
                
                let message=json["message"].unsafelyUnwrapped as!String
                let status = json["status"].unsafelyUnwrapped as!Int
                
                //print(json["status"].unsafelyUnwrapped)//0 username password salah//1 login benar
                if let array = json["data"] as? [[String: Any]] {
                    //If you want array of task id you can try like
                    //let name_wallet = array.flatMap { $0["name_wallet"] as? String }
                    //print(array[0]["name_wallet"].unsafelyUnwrapped)
                    complete(array)
                }
                //status = json["status"].unsafelyUnwrapped as! Int
                
            }
        }
    }
    func getTransaction(complete:@escaping(_ result:[[String:Any]]?)->Void){
        let header = ["token":Config.token]
        print(header)
        print(Config.base_url+Config.getAPI(jenis:"transaction"))
        Alamofire.request(Config.base_url+Config.getAPI(jenis:"transaction/1"),method: .get,encoding:JSONEncoding.default,headers:header).responseJSON { (response) in
            if let json : [String:Any] = response.result.value as?[String:Any]{
                let message=json["message"].unsafelyUnwrapped as!String
                print(message)
                let status = json["status"].unsafelyUnwrapped as!Int
                print(status)
                if let array = json["data"] as? [[String: Any]] {
                    //If you want array of task id you can try like
                    //let name_wallet = array.flatMap { $0["name_wallet"] as? String }
                    //print(array[0]["name_wallet"].unsafelyUnwrapped)
                    print(array)
                    complete(array)
                }
            }
        }
    }
    func getKategoriIncome(complete:@escaping(_ result:[[String:Any]]?)->Void){
        let header = ["token":Config.token]
        
        
        Alamofire.request(Config.base_url+Config.getAPI(jenis:"category/income"), method:.get,parameters:nil,encoding:JSONEncoding.default,headers:header).responseJSON{
            response in
            if let json : [String:Any] = response.result.value as?[String:Any]{
                let message=json["message"].unsafelyUnwrapped as!String
                let status = json["status"].unsafelyUnwrapped as!Int
                if let array = json["data"] as? [[String: Any]] {
                    //If you want array of task id you can try like
                    //let name_wallet = array.flatMap { $0["name_wallet"] as? String }
                    //print(array[0]["name_wallet"].unsafelyUnwrapped)
                    complete(array)
                }
            }
        }
    }
    func getKategoriExpense(complete:@escaping(_ result:[[String:Any]]?)->Void){
        let header = ["token":Config.token]
        
        
        Alamofire.request(Config.base_url+Config.getAPI(jenis:"category/expense"), method:.get,parameters:nil,encoding:JSONEncoding.default,headers:header).responseJSON{
            response in
            if let json : [String:Any] = response.result.value as?[String:Any]{
                let message=json["message"].unsafelyUnwrapped as!String
                let status = json["status"].unsafelyUnwrapped as!Int
                if let array = json["data"] as? [[String: Any]] {
                    //If you want array of task id you can try like
                    //let name_wallet = array.flatMap { $0["name_wallet"] as? String }
                    //print(array[0]["name_wallet"].unsafelyUnwrapped)
                    complete(array)
                }
            }
        }
    }
    func getKategoriOther(complete:@escaping(_ result:[[String:Any]]?)->Void){
        let header = ["token":Config.token]
        
        
        Alamofire.request(Config.base_url+Config.getAPI(jenis:"category/other"), method:.get,parameters:nil,encoding:JSONEncoding.default,headers:header).responseJSON{
            response in
            if let json : [String:Any] = response.result.value as?[String:Any]{
                let message=json["message"].unsafelyUnwrapped as!String
                let status = json["status"].unsafelyUnwrapped as!Int
                if let array = json["data"] as? [[String: Any]] {
                    //If you want array of task id you can try like
                    //let name_wallet = array.flatMap { $0["name_wallet"] as? String }
                    //print(array[0]["name_wallet"].unsafelyUnwrapped)
                    complete(array)
                }
            }
        }
    }
    
    func getAllKategori(complete:@escaping(_ result:[[String:Any]]?)->Void){
        let header = ["token":Config.token]
        
       print(Config.base_url+Config.getAPI(jenis:"category"))
        Alamofire.request(Config.base_url+Config.getAPI(jenis:"category"), method:.get,parameters:nil,encoding:JSONEncoding.default,headers:header).responseJSON{
            response in
            if let json : [String:Any] = response.result.value as?[String:Any]{
                let message=json["message"].unsafelyUnwrapped as!String
                let status = json["status"].unsafelyUnwrapped as!Int
                if let array = json["data"] as? [[String: Any]] {
                    //If you want array of task id you can try like
                    //let name_wallet = array.flatMap { $0["name_wallet"] as? String }
                    //print(array[0]["name_wallet"].unsafelyUnwrapped)
                    complete(array)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        emailText.text = Config.uID
        getTransaction(complete:{(result) in
            //print(result?.count)
            for n in 0..<result!.count{
                 print(result![n])
            }
           
        })
        getAllKategori { (result) in
            //print(result[0]["category_img"])
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // indexview = indexPath.row
        //performSegue(withIdentifier: "segue", sender: self)
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
