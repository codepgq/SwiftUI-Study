//
//  ZStackExample.swift
//  SwiftUI-d5-Stack
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ZStackExample: View {
    var body: some View {
        ZStack {
            Image(systemName: "play")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .frame(width: 200, height: 200, alignment: .center)
        .background(Color.orange)
    }
}

struct ZStackExample_Previews: PreviewProvider {
    static var previews: some View {
        ZStackExample()
    }
}
