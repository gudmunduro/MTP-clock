//
//  TodayViewController.swift
//  Clock widget
//
//  Created by Guðmundur Halldórsson on 22/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    var postID: String?
    var SSN: String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadLocalData()
        loadPostID()
    }
    @IBAction func clockInOutButtonOnTouchUpInside(_ sender: Any) {
        guard let postIDUnwrapped = postID, let SSNUnwrapped = SSN else {
            debugPrint("postID and SSN cannot be nil")
            return
        }
        MTPApi.clockInOut(postID: postIDUnwrapped, SSN: SSNUnwrapped) { _ in
            debugPrint("Clock in out done")
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}

// MARK: Data functions
extension TodayViewController {
    private func loadLocalData() {
        LocalData.load { localData in
            self.SSN = localData.SSN
        }
    }
    
    private func loadPostID() {
        MTPApi.loadPostID { postID in
            self.postID = postID
        }
    }
}
