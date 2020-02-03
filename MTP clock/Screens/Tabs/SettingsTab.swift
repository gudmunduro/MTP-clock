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
    
    init()
    {
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: SetSSNPage(SSNText: state.SSN ?? "")) {
                        HStack {
                            Image(systemName: "person.fill")
                            Text("Kennitala")
                            Spacer()
                            Text(state.SSN ?? "")
                                .foregroundColor(Color.gray)
                        }
                    }
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
