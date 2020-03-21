//
//  ContentView.swift
//  SwiftUI-d2-Buttons
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                
                NavigationLink(destination: ButtonView()) {
                    Text("Button")
                }
                
                NavigationLink(destination: NavigationLinkView()) {
                    Text("NavigationLinkView")
                }
                
                NavigationLink(destination: MenuButtonView()) {
                    Text("MenuButton")
                }
                
                NavigationLink(destination: EditButtonView()) {
                    Text("EditButton")
                }
                
                NavigationLink(destination: PasteButtonView()) {
                    Text("PasteButton")
                }
            }
            .navigationBarTitle(Text("Buttons").foregroundColor(.orange).bold())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
