//
//  ListExample.swift
//  SwiftUI-d6-ListsAndScrollViews
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ListExample: View {
    
    var body: some View {
        List {
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
        }
    }
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        ListExample()
    }
}
