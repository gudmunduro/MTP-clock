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
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.top, 50)
            Text(state.SSN ?? "Kennitala ekki valin")
                .padding()
            Button(action: didPressClockInOutButton) {
                Text("Stimpla inn/út")
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(5)
                .frame(width: 200.0)
            }.disabled(state.SSN == nil)
            Text(state.historyItems.first?.description ?? "")
                .padding()
            Spacer()
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
