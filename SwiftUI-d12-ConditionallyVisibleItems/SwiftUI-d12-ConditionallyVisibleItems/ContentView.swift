//
//  ContentView.swift
//  SwiftUI-d12-ConditionallyVisibleItems
//
//  Created by pgq on 2020/3/20.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            List {
                
                NavigationLink(destination: EmptyViewExample()) {
                    Text("EmptyView Example")
                }
                
                NavigationLink(destination: EqualtableViewExample()) {
                    Text("EqualtableView Example")
                }
            }
            
        .navigationBarTitle("Conditionally VisiableItems")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
