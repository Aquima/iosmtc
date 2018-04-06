//
//  User.swift
//  MTCSwift
//
//  Created by NARA on 4/5/18.
//  Copyright © 2018 MTC. All rights reserved.
//

import UIKit
//patron singleton
class User: NSObject {
    static let sharedInstance : User = {
        let instance = User()
        return instance
    }()
    var age:UInt = 0
    var name:String = ""
}
