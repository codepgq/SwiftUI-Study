//
//  ToggleView.swift
//  SwiftUI-d3-ValueSelectors
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ToggleView: View {
    
    @State var isOn: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Toggle(isOn: $isOn) {
                Text("是否打开: \(isOn ? "打开" : "关闭")")
            }
        }.padding()
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
