//
//  AppState.swift
//  Clock widget
//
//  Created by Guðmundur Halldórsson on 24/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var SSN: String?
    @Published var postID: String?
    @Published var historyItems: [HistoryItem]
    
    init() {
        SSN = nil
        postID = nil
        historyItems = []
    }
    
    func initialSetup() {
        loadLocalData()
        loadPostID()
    }
}

// MARK: Modifiers
extension AppState {
    func setSSN(to SSN: String?) {
        self.SSN = SSN
    }
    func setPostID(to postID: String?) {
        self.postID = postID
    }
    func setHistoryItems(to historyItems: [HistoryItem]) {
        self.historyItems = historyItems
    }
}

// MARK: Async modifiers
extension AppState {
    func loadLocalData() {
        LocalData.load { localData in
            DispatchQueue.main.async {
                self.setSSN(to: localData.SSN)
            }
        }
    }
    
    func loadPostID() {
        // Does not seem to matter what the postID is, so it's better to just genrate it locally
        //
        // MTPApi.loadPostID { postID in
        //    self.setPostID(to: postID)
        // }
        //
        let postID = MTPApi.generatePostID()
        setPostID(to: postID)
    }
    
    func saveSSN(to SSN: String?) {
        setSSN(to: SSN)
        saveLocalData() // Might cause race conditions
    }
    
    func clockInOut() {
        guard let postID = postID, let SSN = SSN else {
            debugPrint("SSN and postID cannot be nil")
            return
        }
        MTPApi.clockInOut(postID: postID, SSN: SSN) { historyItems in
            DispatchQueue.main.async {
                self.setHistoryItems(to: historyItems)
            }
        }
    }
}

// MARK: Other functions
extension AppState {
    func saveLocalData() {
        LocalData(SSN: SSN).save()
    }
}
