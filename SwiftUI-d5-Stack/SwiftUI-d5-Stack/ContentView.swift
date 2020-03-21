//
//  ContentView.swift
//  SwiftUI-d5-Stack
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: HStackExample()) {
                    Text("水平布局 HStack")
                }
                
                NavigationLink(destination: VStackExample()) {
                    Text("垂直布局 VStack")
                }
                
                NavigationLink(destination: ZStackExample()) {
                    Text("叠加布局 ZStack")
                }
            }
            
            .navigationBarTitle("Stack")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
