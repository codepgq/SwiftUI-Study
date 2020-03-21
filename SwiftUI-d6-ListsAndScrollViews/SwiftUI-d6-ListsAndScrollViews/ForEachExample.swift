//
//  ForEachExample.swift
//  SwiftUI-d6-ListsAndScrollViews
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ForEachExample: View {
    var body: some View {
        List {
            ForEach(0...100, id: \.self) { row in
                Text("Hello, World! \(row)")
            }
        }
    }
}

struct ForEachExample_Previews: PreviewProvider {
    static var previews: some View {
        ForEachExample()
    }
}
