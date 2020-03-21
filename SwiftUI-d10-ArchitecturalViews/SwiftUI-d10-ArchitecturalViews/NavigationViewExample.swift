//
//  NavigationViewExample.swift
//  SwiftUI-d10-ArchitecturalViews
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct NavigationViewExample: View {
    var body: some View {
        Text("test")
            .navigationBarTitle(Text("Demo"), displayMode: .inline)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarItems(
                trailing: HStack{
                    Button(action: {}) { Text("编辑") }
                    Image(systemName: "play")
                    EditButton()
            })
//            .navigationBarItems(leading: Button(action: {}){
//                Text("返回")
//                self.
//            })
    }
}

struct NavigationViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewExample()
    }
}
