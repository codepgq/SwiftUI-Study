//
//  ContentView.swift
//  SwiftUI-d10-ArchitecturalViews
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: NavigationViewExample()) {
                    Text("NavigationView")
                }
                
                NavigationLink(destination: TabViewExample()) {
                    Text("TableViewExample")
                }
                
                NavigationLink(destination: HSplitViewExample()) {
                    Text("HSplitViewExample")
                }
                
                NavigationLink(destination: VSplitViewExample()) {
                    Text("VSplitViewExample")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
