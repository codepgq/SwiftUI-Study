//
//  AnyViewEmpty.swift
//  SwiftUI-d14-InfrequentlyUsedViews
//
//  Created by pgq on 2020/3/20.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct AnyViewExample: View {
    var body: some View {
        AnyView(Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/))
    }
}

struct AnyViewExample_Previews: PreviewProvider {
    static var previews: some View {
        AnyViewExample()
    }
}
