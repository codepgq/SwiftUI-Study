//
//  ContentView.swift
//  SwiftUI-d1-Image
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

/**
 https://developer.apple.com/design/resources/ 去下载图片
 */

struct ContentView: View {
    @State var isOn: Bool = false
    var body: some View {
        
        Toggle(isOn: $isOn) {
            HStack {
                Text("关闭/打开").foregroundColor(.black)
                Image(systemName: "person.crop.circle")
                .foregroundColor( !isOn ? .gray : .green)
            }
        }
        .foregroundColor(.purple)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
