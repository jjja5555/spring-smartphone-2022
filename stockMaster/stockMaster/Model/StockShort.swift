//
//  StockShort.swift
//  stockMaster
//
//  Created by Xiao Huang on 2/27/22.
//

import Foundation
import RealmSwift

class StockShort : Object{
    
    //does cocoapods has UUID generator
    @objc dynamic var symbol : String = ""
    @objc dynamic var price : Float = 0.0
    @objc dynamic var volume : Int = 0
    
    override static func primaryKey() -> String? {
        return "symbol"
    }
    
}


