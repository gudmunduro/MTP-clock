//
//  AppState.swift
//  MTP clock
//
//  Created by Guðmundur Halldórsson on 20/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var SSN: String?
    @Published var postID: String?
    @Published var historyItems: [HistoryItem]
    
    init() {
        SSN = "1404002030"
        postID = nil
        historyItems = []
    }
    
    func initialSetup() {
        loadPostID()
    }
}

// MARK: Modifiers
extension AppState {
    func setSSN(to SSN: String) {
        self.SSN = SSN
    }
}

// MARK: Async modifiers
extension AppState {
    func loadPostID() {
        MTPApi.loadPostID { postID in
            self.postID = postID
        }
    }
    
    func clockInOut() {
        guard let postIDUnwrapped = postID, let SSNUnwrapped = SSN else {
            debugPrint("SSN and postID cannot be nil")
            return
        }
        MTPApi.clockInOut(postID: postIDUnwrapped, SSN: SSNUnwrapped) { historyItems in
            self.historyItems = historyItems
        }
    }
}