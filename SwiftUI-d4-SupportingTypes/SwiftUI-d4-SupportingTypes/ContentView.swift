//
//  ContentView.swift
//  SwiftUI-d4-SupportingTypes
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: LocalizedView()) {
                    Text("LocalizedView")
                }
                
                NavigationLink(destination: ViewBuilderExample()) {
                    Text("ViewBuilderExample")
                }
            }
                
            .navigationBarTitle("Supporting Types")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
