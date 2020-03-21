//
//  ContentView.swift
//  SwiftUI-d7-ContainerViews
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: FormView()) {
                    Text("From")
                }
                NavigationLink(destination: GroupView()) {
                    Text("Group")
                }
                NavigationLink(destination: GroupBoxView()) {
                    Text("GroupBox")
                }
                NavigationLink(destination: SectionView()) {
                    Text("Section")
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
