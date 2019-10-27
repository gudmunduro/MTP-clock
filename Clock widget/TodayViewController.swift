//
//  TodayViewController.swift
//  Clock widget
//
//  Created by Guðmundur Halldórsson on 22/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import UIKit
import SwiftUI
import NotificationCenter

class TodayViewController: UIViewController {
    var SSN: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    }
    
    @IBSegueAction func addSwiftUIViewSegueAction(_ coder: NSCoder) -> UIViewController? {
        let state = AppState()
        state.initialSetup()

        let hostingController = UIHostingController(coder: coder, rootView: TodayView().environmentObject(state))
        hostingController?.view.backgroundColor = .clear

        return hostingController
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}

extension TodayViewController: NCWidgetProviding {
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .expanded {
            preferredContentSize = CGSize(width: 0, height: 290)
        } else {
            preferredContentSize = maxSize
        }
    }
}
