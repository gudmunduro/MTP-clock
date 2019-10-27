//
//  SetSSNView.swift
//  Clock widget
//
//  Created by Guðmundur Halldórsson on 24/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import SwiftUI

struct SetSSNView: View {
    @EnvironmentObject var state: AppState
    @State var SSNTextFieldText = ""
    
    var body: some View {
        VStack {
            Text(SSNTextFieldText)
                .padding(.bottom, 30)
            VStack {
                ForEach(0..<3, id: \.self) { row in
                    HStack {
                        ForEach(1...3, id: \.self) { column in
                            Button(action: { self.onNumpadButtonPress(self.calculateButtonIndex(row, column)) }) {
                                Text(String(self.calculateButtonIndex(row, column)))
                                    .foregroundColor(.black)
                                .padding()
                                .background(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)))
                                .cornerRadius(5)
                                .padding(3)
                            }
                        }
                    }
                }
                HStack {
                    Button(action: onNumpadBackspaceButtonPress) {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color.black)
                        .padding(EdgeInsets(top: 20, leading: 13, bottom: 20, trailing: 13))
                        .background(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)))
                        .cornerRadius(5)
                        .padding(3)
                    }
                    Button(action: { self.onNumpadButtonPress(0) }) {
                        Text("0")
                            .foregroundColor(.black)
                        .padding()
                        .background(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)))
                        .cornerRadius(5)
                        .padding(3)
                    }
                    Button(action: onNumpadSetButtonPress) {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(Color.black)
                        .padding(EdgeInsets(top: 20, leading: 13, bottom: 20, trailing: 13))
                        .background(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)))
                        .cornerRadius(5)
                        .padding(3)
                    }
                }
            }
        }
    }
}

// MARK: Events
extension SetSSNView {
    func onNumpadButtonPress(_ number: Int) {
        SSNTextFieldText += String(number)
    }
    func onNumpadBackspaceButtonPress() {
        guard SSNTextFieldText.count > 0 else {
            return
        }
        SSNTextFieldText.removeLast()
    }
    func onNumpadSetButtonPress() {
        state.saveSSN(to: SSNTextFieldText)
    }
}

// MARK: Functions
extension SetSSNView {
    func calculateButtonIndex(_ row: Int, _ column: Int) -> Int {
        return column + row * 3
    }
}

// MARK: Preview
struct SetSSNView_Previews: PreviewProvider {
    static var previews: some View {
        SetSSNView()
    }
}
