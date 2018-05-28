//
//  conf.swift
//  Moneylover
//
//  Created by DaFIDS on 16/05/18.
//  Copyright © 2018 DaFIDS. All rights reserved.
//

import Foundation

struct Config
{
    static var base_url:String = "http://localhost/moneylover/"
    static var uID = ""
    static var token = ""
    static func getAPI(jenis:String)->(String){
        return jenis
    }   
}
