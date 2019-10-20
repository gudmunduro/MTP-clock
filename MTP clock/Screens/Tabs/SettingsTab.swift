//
//  SettingsTab.swift
//  MTP clock
//
//  Created by Guðmundur Halldórsson on 20/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import SwiftUI

struct SettingsTab: View {
    @EnvironmentObject var state: AppState
    var body: some View {
        NavigationView {
            List {
                Section {
                    SettingRow(
                        image: Image(systemName: "person.fill"),
                        title: "Kennitala",
                        value: state.SSN ?? "",
                        action: self.didPressChangeSSNRow
                    )
                }
            }
            .navigationBarTitle("Stillingar")
        }
    }
}

// MARK: Events
extension SettingsTab {
    func didPressChangeSSNRow() {
        
    }
}

// MARK: Preview
struct SettingsTab_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTab()
    }
}
