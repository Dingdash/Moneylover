//
//  ViewController.swift
//  Moneylover
//
//  Created by DaFIDS on 10/05/18.
//  Copyright © 2018 DaFIDS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    var signupmode = false
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBAction func topTapped(_ sender: Any) {
        if signupmode{//signup
            if let email = emailText.text{
                if let password = passwordText.text{
                    presentAlert(alert: "tes")
                }
            }
        }else{//login
            if let email = emailText.text{
                if let password = passwordText.text{
                    
                }
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
        // Do any additional setup after loading the view, typically from a nib.
        print(signupmode)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

