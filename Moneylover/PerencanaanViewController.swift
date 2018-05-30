//
//  PerencanaanViewController.swift
//  Moneylover
//
//  Created by DaFIDS on 10/05/18.
//  Copyright © 2018 DaFIDS. All rights reserved.
//

import UIKit

class PerencanaanViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let cellContent = ["Anggaran","Acara","Tabungan","Transaksi Berulang","Tagihan"]
    let descriptionContent = ["Mengatur anggaran untuk masing-masing kategori atau untuk semua kategori sekaligus dalam satu dompet.","Membuat sebuah acara/event tersebut berlangsung,misalnya untuk memantau pengeluaran ketika melakukan perjalanan akhir pekan.","Membuat rencana simpanagan adalah cara yang baik untuk mengamankan uang untuk kebutuhan masa depan, atau untuk membeli barang baru.","Membuat transaksi berulang yang secara otomatis akan ditambahkan di waktu yang akan datang","Memantau tagihan berulang Anda seperti listrik, sewa, langganan internet, dll."]
    var indexview=0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count+descriptionContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row%2==0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PerencanaanCell")
           
            let label = cell?.viewWithTag(1) as! UILabel
            label.text = cellContent[indexPath.row/2]
            return cell!
        }else
        {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell")
            //cell2.selectionStyle = UITableViewCellSelectionStyle.none
            let label = cell2?.viewWithTag(2) as! UILabel
            
            
            label.text = descriptionContent[indexPath.row/2]
            return cell2!
        }
        
        
        
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
        indexview = indexPath.row
        //self.performSegueWithIdentifier("segueAnggaran", sender: nil)
     //   self.performSegue(withIdentifier: "segueAnggaran", sender: nil)
        
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
