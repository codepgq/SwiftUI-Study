//
//  ContentView.swift
//  SwiftUI-d15-DrawingAndAnimation
//
//  Created by pgq on 2020/3/20.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            List {
                NavigationLink(destination: AnimationExample()) {
                    Text("Animation 动画")
                }
                
                NavigationLink(destination: ShapesExample()) {
                    Text("Shapes 形状")
                }
                
                
                NavigationLink(destination: TransformedShapesExample()) {
                    Text("Transformed Shapes")
                }
                
                NavigationLink(destination: PaintsStylesGradients()) {
                    Text("Paints, Styles, and Gradients Shapes")
                }
                
                
                NavigationLink(destination: GeometryExample()) {
                    Text("Geometry")
                }
                
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
