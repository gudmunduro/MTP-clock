//
//  ClockTab.swift
//  MTP clock
//
//  Created by Guðmundur Halldórsson on 20/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import SwiftUI

struct ClockTab: View {
    @EnvironmentObject var state: AppState
    var body: some View {
        Button(action: didPressClockInOutButton) {
            Text("Stimpla inn/út")
            .padding()
            .background(Color.red)
            .foregroundColor(Color.white)
            .cornerRadius(5)
        }
    }
}

// MARK: Events
extension ClockTab {
    func didPressClockInOutButton() {
        state.clockInOut()
    }
}

// MARK: Preview
struct ClockTab_Previews: PreviewProvider {
    static var previews: some View {
        ClockTab()
    }
}
