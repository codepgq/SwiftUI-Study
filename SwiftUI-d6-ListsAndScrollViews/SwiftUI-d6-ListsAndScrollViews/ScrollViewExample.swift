//
//  ScrollViewExample.swift
//  SwiftUI-d6-ListsAndScrollViews
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ScrollViewExample: View {
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                Text("Hello, World! vertical")
                Text("Hello, World! vertical")
                Text("Hello, World! vertical")
                Text("Hello, World! vertical")
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                Text("Hello, World! horizontal")
                Text("Hello, World! horizontal")
                Text("Hello, World! horizontal")
                Text("Hello, World! horizontal")
            }
        }
    }
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
