//
//  StepperView.swift
//  SwiftUI-d3-ValueSelectors
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct StepperView: View {
    @State var age: Int = 18
    
    var body: some View {
        List {
            Stepper(onIncrement: {
                print("onIncrement")
            }, onDecrement: {
                print("onDecrement")
            }) {
                Text("xxxxx")
            }
            
            
            Stepper("您的年龄 \(age)",
                    value: $age, step: 1) { (editing) in
                        
            }
        }
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
