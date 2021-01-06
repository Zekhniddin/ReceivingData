//
//  HomeScreen.swift
//  ReceivingData
//
//  Created by Зехниддин on 07/01/21.
//

import SwiftUI

struct HomeScreen: View, BindingProtocol {
    @State private var showPresentScreen = false
    @State private var name = ""
    
    func onReceived<T>(value: T) {
        self.name = value as! String
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextHead(name: self.name)
                
                TextFieldStyle(name: $name, placeholder: "Enter your name...")
                Button(action: {
                    self.showPresentScreen.toggle()
                }) {
                    ButtonSytle(btnName: "Present")
                }
                .sheet(isPresented: $showPresentScreen) {
                    PresentScreen(delegate: self, name: name)
                }
            }
            .navigationBarTitle("Home Page", displayMode: .inline)
        }
        
    }
}

struct TextHead: View {
    var name: String
    
    var body: some View {
        Text(name)
            .font(.title)
            .padding()
    }
}

struct TextFieldStyle: View {
    @Binding var name: String
    var placeholder: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "person.fill")
            TextField(placeholder, text: $name)
        }
        .frame(height: 30)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
        .padding(.horizontal, 20)
    }
}

struct ButtonSytle: View {
    var btnName: String
    var body: some View {
        Text(btnName)
            .frame(width: 120, height: 60)
            .background(LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .top, endPoint: .bottom).opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(8)
            .shadow(color: .black, radius: 5, y: 2)
            .font(.title2)
            .padding(.top, 10)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
