//
//  conf.swift
//  Moneylover
//
//  Created by DaFIDS on 16/05/18.
//  Copyright © 2018 DaFIDS. All rights reserved.
//

import Foundation

struct Conf
{
    var base_url:String = "http://localhost/"
    static var uID = ""
    static var token = ""
    mutating func setuser(user:String){
        Conf.uID = user
    }
    mutating func setToken(token:String){
        Conf.token = token
    }
    
}
