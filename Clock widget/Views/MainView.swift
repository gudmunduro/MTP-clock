//
//  MainView.swift
//  Clock widget
//
//  Created by Guðmundur Halldórsson on 24/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        VStack {
            HStack {
                Button(action: onClockInOutButtonPress) {
                    Text("Stimpla inn/út")
                        .foregroundColor(.white)
                    .padding()
                    .background(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)))
                    .cornerRadius(5)
                }
                Button(action: onChangeSSNButtonPress) {
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                    .padding(20)
                    .background(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)))
                    .cornerRadius(5)
                }
            }.padding(.bottom, 10)
            Text(state.historyItems.first?.description ?? "")
        }
    }
}

// MARK: Events
extension MainView {
    func onClockInOutButtonPress() {
        state.clockInOut()
    }
    func onChangeSSNButtonPress() {
        state.saveSSN(to: nil)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
