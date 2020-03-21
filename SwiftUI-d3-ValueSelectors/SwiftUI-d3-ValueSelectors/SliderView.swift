//
//  SliderView.swift
//  SwiftUI-d3-ValueSelectors
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    @State var value: Float = 0
    
    var body: some View {
        VStack {
            Text("\(value)")
            Slider(
                value: $value,
                in: 0.0...1.0,
                step: 0.01,
                minimumValueLabel: Image(systemName: "sun.min"),
                maximumValueLabel: Image(systemName: "sun.max")
            ) {
                Text("aaa")
            }.accentColor(.red)
            
            Image("load.png")
                .frame(width: 200, height: 200)
                .scaleEffect(CGFloat(value))
            Spacer()
        }.padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
