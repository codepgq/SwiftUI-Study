//
//  SecureFieldExample.swift
//  SwiftUI-Text
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct SecureFieldExample: View {
    @State var text: String = ""
    var body: some View {
        VStack {
            Text("\(text)")
                .rotation3DEffect(Angle(degrees: -30), axis: (0,0,1), anchor: UnitPoint(x: 0.5, y: 0.5), anchorZ: 1, perspective: 1)
            
            Text("\(text)")
            .rotation3DEffect(Angle(degrees: 30), axis: (0,0,1), anchor: UnitPoint(x: 0.5, y: 0.5), anchorZ: 1, perspective: 0)
            
            SecureField("Please enter your name", text: $text)
                .background(Color.orange)
                
                .shadow(radius: 10)
                .frame(height: 50)
                
            Spacer()
        }.padding()
        
    }
}

struct SecureFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldExample()
    }
}
