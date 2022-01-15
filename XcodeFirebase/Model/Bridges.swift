//
//  Bridges.swift
//  XcodeFirebase
//
//  Created by Himanshu Churi on 1/14/22.
//

import Foundation

struct Bridge: Identifiable{
    var id: String = UUID().uuidString
    var city : String
    var country: String
    var desc: String
    var imageName: String
    var name: String
}
