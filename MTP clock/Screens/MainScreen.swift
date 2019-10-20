//
//  MainScreen.swift
//  MTP clock
//
//  Created by Guðmundur Halldórsson on 20/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        TabView {
            ClockTab()
                .tabItem {
                    Image(systemName: "clock")
                    Text("Stimpla")
                }
            SettingsTab()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Stillingar")
                }
        }
    }
}

// MARK: Preview
struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
