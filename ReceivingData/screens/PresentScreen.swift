//
//  PresentScreen.swift
//  ReceivingData
//
//  Created by Зехниддин on 07/01/21.
//

import SwiftUI

struct PresentScreen: View {
    @Environment(\.presentationMode) var presenration
    var delegate: BindingProtocol?
    @State private var surname = ""
    var name = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextHead(name: "\(name) \(surname)")
                
                TextFieldStyle(name: $surname, placeholder: "Enter your surname...")
                
                Button(action: {
                    delegate?.onReceived(value: "\(name) \(surname)")
                    presenration.wrappedValue.dismiss()
                }) {
                    ButtonSytle(btnName: "Back")
                }
            }
            .navigationBarTitle("Present Page", displayMode: .inline)
        }
    }
}

struct PresentScreen_Previews: PreviewProvider {
    static var previews: some View {
        PresentScreen()
    }
}
