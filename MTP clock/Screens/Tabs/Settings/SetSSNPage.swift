//
//  SetSSNPage.swift
//  MTP clock
//
//  Created by Guðmundur Halldórsson on 21/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import SwiftUI

struct SetSSNPage: View {
    @EnvironmentObject var state: AppState
    @State var SSNText: String
    
    var body: some View {
        NavigationView {
            List {
                TextField("Kennitala", text: $SSNText, onEditingChanged: onSSNTextFieldEditingChanged)
            }
            .navigationBarTitle("Kennitala")
        }
    }
}

// MARK: Events
extension SetSSNPage {
    func onSSNTextFieldEditingChanged(_ changed: Bool) {
        state.setSSN(to: SSNText.isEmpty ? nil : SSNText) // Set to nil if the text field is empty
    }
}

// MARK: Preview
struct SetSSNPage_Previews: PreviewProvider {
    static var previews: some View {
        SetSSNPage(SSNText: "0123456789")
    }
}
