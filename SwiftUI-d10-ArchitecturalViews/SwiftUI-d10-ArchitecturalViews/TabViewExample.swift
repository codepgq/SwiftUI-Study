//
//  TableViewExample.swift
//  SwiftUI-d10-ArchitecturalViews
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct TabViewExample: View {
    @State var tabIndex: Int = 1
    
    var body: some View {
        TabView(selection: $tabIndex) {
            Text("The First Tab")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
            }.tag(0)
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            .tag(1)
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }.tag(2)
        }
        .navigationBarTitle(Text("\(tabIndex)"), displayMode: .inline)
        .font(.headline)
    }
}

struct TableViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TabViewExample()
    }
}
