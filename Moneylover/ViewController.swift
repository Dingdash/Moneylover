//
//  ViewController.swift
//  Moneylover
//
//  Created by DaFIDS on 10/05/18.
//  Copyright © 2018 DaFIDS. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var conf = Conf()
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    var signupmode = false
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBAction func topTapped(_ sender: Any) {
        if signupmode{//signup
            if let email = emailText.text{
                if let password = passwordText.text{
                    //presentAlert(alert: "tes")
                    
                 
                }
            }
        }else{//login
            if let email = emailText.text {
                if let password = passwordText.text{
                    _ = cekuser(usr: email,pass: password){
                        (status,message,token) in
                        if(status==0)
                        {
                            self.presentAlert(alert: message)
                        }
                    }
                }else
                {
                    presentAlert(alert: "Email dan Password tidak boleh kosong")
                }
            }else{
                presentAlert(alert: "Email dan Password tidak boleh kosong")
            }
        }
    }
    func presentAlert(alert:String){
        let alertVC = UIAlertController(title:"Error",message:alert,preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alertVC.dismiss(animated: true, completion: nil)
        }
        alertVC.addAction(okAction)
        present(alertVC,animated: true,completion: nil)
        
    }
    @IBAction func bottomTapped(_ sender: Any){
        if signupmode{
            signupmode = false
            topButton.setTitle("Log In", for: .normal)
            titleLabel.text = "Log In"
            bottomButton.setTitle("Switch to Sign Up", for: .normal)
        }else{
            signupmode = true
            topButton.setTitle("Sign Up", for: .normal)
            titleLabel.text = "Sign Up"
            bottomButton.setTitle("Switch to Log In", for: .normal)
        }
    }
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func cekuser(usr:String,pass:String,complete:@escaping (_ status:Int,_ message:String,_ token:String)->Void){
        let body = ["email":usr,"password":pass]
        // let body = ["email":"bayusyafresalizdham@gmail.com","password":"bayuganteng2312"]
       Alamofire.request("http://localhost/moneylover/login",method: .post,parameters:body,headers:nil).responseJSON { response in
            if let json : [String : Any] = response.result.value as?[String:Any] {
                let message=json["message"].unsafelyUnwrapped as!String
                let status = json["status"].unsafelyUnwrapped as!Int
               // print(json["status"].unsafelyUnwrapped)//0 username password salah//1 login benar
                //status = json["status"].unsafelyUnwrapped as! Int
                var result : [String:Any] = json["data"] as![String:Any]
                var token = ""
                if result["token"] != nil {
                    token = result["token"].unsafelyUnwrapped as! String
                    }
                 complete(status,message,token)
                }
            }
            // if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
            //    print("Data: \(utf8Text)") // original server data as UTF8 string
            // }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

