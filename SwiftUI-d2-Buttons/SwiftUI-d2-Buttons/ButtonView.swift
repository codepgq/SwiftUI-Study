//
//  ButtonView.swift
//  SwiftUI-d2-Buttons
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button(action: { }) {
                    Text("DefaultButtonStyle")
            }.buttonStyle(DefaultButtonStyle())
            
            Button(action: { }) {
                    Text("PlainButtonStyle")
            }.buttonStyle(PlainButtonStyle())
            
//            Button(action: { }) {
//                    Text("PlainButtonStyle")
//            }.buttonStyle(LinkButtonStyle())
            
            
//            Button(action: { }) {
//                    Text("BorderedButtonStyle")
//            }.buttonStyle(BorderedButtonStyle())
            
            Button(action: { }) {
                Text("BorderlessButtonStyle")
            }.buttonStyle(BorderlessButtonStyle())
            
            
            
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
