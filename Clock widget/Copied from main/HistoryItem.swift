//
//  HistoryItem.swift
//  MTP clock
//
//  Created by Guðmundur Halldórsson on 20/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import Foundation

struct HistoryItem {
    let time: String
    let name: String
    let state: String
}

// MARK: String interpolation
extension HistoryItem: CustomStringConvertible {
    var description: String {
        return "\(time) \(name) \(state.uppercased())"
    }
}
