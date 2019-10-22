//
//  MTP.swift
//  MTP clock
//
//  Created by Guðmundur Halldórsson on 20/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import Alamofire

struct ClockInOutParameters: Codable {
    let postId: String
    let SSN: String
    let unitId: Int
}
