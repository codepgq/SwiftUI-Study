//
//  ContentView.swift
//  SwiftUI-d8-SpacersAndDividers
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Divider().background(Color.red)
            Text("你好！")
                .font(.largeTitle)
                .shadow(radius: 10)
            Divider().background(Color.green)
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
