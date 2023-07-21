//
//  ContentView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                
                NavigationLink {
                    LandingPageView()
                } label: {
                    Text("hahaha")
                }

            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
