//
//  ContentView.swift
//  SwiftUI-d14-InfrequentlyUsedViews
//
//  Created by pgq on 2020/3/20.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AnyViewExample()) {
                    Text("AnyView Example")
                }
                NavigationLink(destination: AnyViewExample()) {
                    Text("TupleView Example")
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
