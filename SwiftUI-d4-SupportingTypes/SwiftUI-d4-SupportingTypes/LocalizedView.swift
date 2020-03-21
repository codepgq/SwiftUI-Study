//
//  LocalizedView.swift
//  SwiftUI-d4-SupportingTypes
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct LocalizedView: View {
    var loc: String = "en"
       @State var isEn = true
    
    var body: some View {
        VStack {
            Toggle(isOn: $isEn) {
                HStack {
                    Text("English")
                    Text("/")
                    Text("Chinese")
                }
            }
            
            VStack {
                Text("Welcome into my app")
                    .font(.title)
                Text("Start by tapping this button")
                    .font(.body)
            }
            
            Button("Start browsing") {
                
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(109)
        }
        .padding()
        .border(Color.purple, width: 1)
         .environment(\.locale, .init(identifier: isEn ? "en" : "zh"))
    }
}

struct LocalizedView_Previews: PreviewProvider {
    static var previews: some View {
        LocalizedView()
    }
}
