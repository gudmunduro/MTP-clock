//
//  SettingsListItem.swift
//  MTP clock
//
//  Created by Guðmundur Halldórsson on 20/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import SwiftUI

struct SettingRow: View {
    let image: Image
    let title: String
    let value: String?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                image
                Text(title)
                Spacer()
                Text(value ?? "")
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingRow(image: Image("person.fill"), title: "Test", value: "testvalue", action: {})
    }
}
