//
//  NavigationLinkView.swift
//  SwiftUI-d2-Buttons
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct NavigationLinkView: View {
    
    var nextView = NavigationLinkNextView()
    
    @State var isActive: Bool = false
    
    var body: some View {
        List {
            NavigationLink(destination: nextView, isActive: $isActive) {
                Text("NavigationLink(destination: nextView, isActive: $isActive)")
            }
            
            NavigationLink("NavigationLink(\"Title\", destination: nextView)", destination: nextView)
            
            
            NavigationLink(destination: nextView) {
                Text("NavigationLink(destination: nextView, isActive: $isActive)")
            }.isDetailLink(true)
            
            NavigationLink(destination: nextView) {
                Text("NavigationLink(destination: nextView, isActive: $isActive)")
            }.isDetailLink(false)
        }
    }
}

struct NavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkView()
    }
}


struct NavigationLinkNextView: View {
    var body: some View {
        NavigationView {
            Text("你好")
            
            .navigationBarTitle("Detail")
        }
    }
}
