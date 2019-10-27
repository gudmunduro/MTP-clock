//
//  TodayView.swift
//  Clock widget
//
//  Created by Guðmundur Halldórsson on 24/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import SwiftUI

struct TodayView: View {
    @EnvironmentObject var state: AppState
    
    var body: some View {
        Group {
            if state.SSN != nil {
                MainView()
            } else {
                SetSSNView()
            }
        }
    }
}

// MARK: Preview
struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
