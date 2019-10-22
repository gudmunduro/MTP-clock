//
//  LocalDataManager.swift
//  MTP clock
//
//  Created by Guðmundur Halldórsson on 21/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import SwiftUI

final class LocalData: Codable {
    let SSN: String?
    
    init(SSN: String?) {
        self.SSN = SSN
    }
}

// MARK: Functions
extension LocalData {
    
    static func fileManager() throws -> URL {
        return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    static func fileLocation() throws -> URL {
        let fileMgr = try fileManager()
        return fileMgr.appendingPathComponent("data").appendingPathExtension("json")
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async {
            do {
                let location = try LocalData.fileLocation()
                let jsonData = try JSONEncoder().encode(self)
                try jsonData.write(to: location)
            } catch {
                debugPrint(error)
            }
        }
    }
    
    static func load(onLoad: @escaping (LocalData) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let location = try LocalData.fileLocation()
                let jsonData = try Data(contentsOf: location)
                let localData = try JSONDecoder().decode(LocalData.self, from: jsonData)
                
                onLoad(localData)
            } catch {
                debugPrint(error)
            }
        }
    }
}
