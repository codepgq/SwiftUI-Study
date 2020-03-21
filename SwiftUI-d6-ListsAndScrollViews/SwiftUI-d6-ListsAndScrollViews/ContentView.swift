//
//  ContentView.swift
//  SwiftUI-d6-ListsAndScrollViews
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            List {
                NavigationLink(destination: ListExample()) {
                    Text("List")
                }
                
                NavigationLink(destination: ForEachExample()) {
                    Text("ForEach")
                }
                
                NavigationLink(destination: ScrollViewExample()) {
                    Text("ScrollViewExample")
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
