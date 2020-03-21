//
//  EqualtableViewExample.swift
//  SwiftUI-d12-ConditionallyVisibleItems
//
//  Created by pgq on 2020/3/20.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct EqualtableViewExample: View {
    @State private var n = 3
    
    var body: some View {
        VStack {
            EquatableView(content: NumberParity(number: n))
            
            Text("")
                .frame(height: 30)
            Button("新建一个随机数:\(n)") {
                self.n = Int.random(in: 1...1000)
            }
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
            
            
        }
        .padding(.top, 100)
    }
}

struct EqualtableViewExample_Previews: PreviewProvider {
    static var previews: some View {
        EqualtableViewExample()
    }
}

extension Int {
    var isEven: Bool { self % 2 == 0 }
    var isOdd: Bool { self % 2 != 0}
}

struct NumberParity: View, Equatable {
    
    let number: Int
    @State private var flag = false
    
    var body: some View {
        
        let animation = Animation
            .linear(duration: 3)
            .repeatForever(autoreverses: false)
        
        return VStack {
            if number.isOdd {
                Text("ODD")
            } else {
                Text("EVEN")
            }
        }.foregroundColor(.white)
        .padding(20)
            .background(RoundedRectangle(cornerRadius: 10).fill(self.number.isOdd ? Color.red : Color.green))
            .rotationEffect(self.flag ? Angle(degrees: 20) : Angle(degrees: 360))
            .onAppear {
                withAnimation(animation) {
                    self.flag.toggle()
                    print("xxxxx")
                }
        }
    }
    
    
    static func == (lhs: NumberParity, rhs: NumberParity) -> Bool {
        lhs.number.isOdd == rhs.number.isOdd
    }
}
