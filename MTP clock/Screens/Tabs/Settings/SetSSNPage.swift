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
        List {
            ZStack {
                TextField("Kennitala", text: $SSNText, onEditingChanged: onSSNTextFieldEditingChange)
                HStack {
                    Spacer()
                    if !SSNText.isEmpty {
                        Button(action: onClearSSNButtonPress) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            
        }
        .navigationBarTitle("Kennitala")
    }
}

// MARK: Events
extension SetSSNPage {
    func onSSNTextFieldEditingChange(_ changed: Bool) {
        state.saveSSN(to: SSNText.isEmpty ? nil : SSNText) // Set to nil if the text field is empty
    }
    
    func onClearSSNButtonPress() {
        SSNText = ""
        state.saveSSN(to: nil)
    }
}

// MARK: Preview
struct SetSSNPage_Previews: PreviewProvider {
    static var previews: some View {
        SetSSNPage(SSNText: "0123456789")
    }
}
