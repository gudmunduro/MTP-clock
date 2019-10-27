//
//  String.swift
//  MTP clock
//
//  Created by Guðmundur Halldórsson on 27/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import Foundation

extension String {
    static func random(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
