//
//  LebihViewController.swift
//  Moneylover
//
//  Created by DaFIDS on 10/05/18.
//  Copyright © 2018 DaFIDS. All rights reserved.
//

import UIKit

class LebihViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
