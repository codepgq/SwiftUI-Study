//
//  AnimationExample.swift
//  SwiftUI-d15-DrawingAndAnimation
//
//  Created by pgq on 2020/3/20.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct AnimationExample: View {
    let delay = Animation.easeIn.delay(1.0)
    let repeatCount = Animation.easeIn.repeatCount(10)
    let repeatForever = Animation.easeIn.repeatForever()
    
    @State var updateUI = false
    
    var body: some View {
        List {
            Button("animation") {
                
                self.updateUI.toggle()
            }
            HStack {
                Text("easeIn")
                AnimationViewBuilder(updateUI: self.updateUI) {
                    Image(systemName: "chevron.right.circle")
                }
                .animation(.easeIn)
            }
            
            
            HStack {
                Text("easeInOut")
                AnimationViewBuilder(updateUI: self.updateUI) {
                    Image(systemName: "chevron.right.circle")
                }
                .animation(.easeInOut)
            }
            
            HStack {
                Text("easeOut")
                AnimationViewBuilder(updateUI: self.updateUI) {
                    Image(systemName: "chevron.right.circle")
                }
                .animation(.easeOut)
            }
            
            HStack {
                Text("linear 2s")
                AnimationViewBuilder(updateUI: self.updateUI) {
                    Image(systemName: "chevron.right.circle")
                }
                .animation(.linear(duration: 2.0))
            }
            
            HStack {
                Text("spring")
                AnimationViewBuilder(updateUI: self.updateUI) {
                    Image(systemName: "chevron.right.circle")
                }
                .animation(.spring())
            }
            
            HStack {
                Text("timingCurve")
                AnimationViewBuilder(updateUI: self.updateUI) {
                    Image(systemName: "chevron.right.circle")
                }
                .animation(.timingCurve(10, 0, 100, 0, duration: 2.0))
            }
            
            HStack {
                Text("easeIn delay 1s")
                AnimationViewBuilder(updateUI: self.updateUI) {
                    Image(systemName: "chevron.right.circle")
                }
                .animation(delay)
            }
            
            HStack {
                Text("easeIn repeatCount 10 ")
                AnimationViewBuilder(updateUI: self.updateUI) {
                    Image(systemName: "chevron.right.circle")
                }
                .animation(repeatCount)
            }
            
            HStack {
                Text("easeIn repeatForever ")
                AnimationViewBuilder(updateUI: self.updateUI) {
                    Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                }
                .animation(repeatForever)
            }
        }
    }
}

struct AnimationExample_Previews: PreviewProvider {
    static var previews: some View {
        AnimationExample()
    }
}


struct AnimationViewBuilder<Content: View>: View {
    let updateUI: Bool
    let content: Content
    
    init(updateUI: Bool, @ViewBuilder content:() -> Content ) {
        self.updateUI = updateUI
        self.content = content()
    }
    
    var body: some View {
        content
            .imageScale(.large)
            .rotationEffect(.degrees(updateUI ? 90 : 0))
            .scaleEffect(updateUI ? 1.5 : 0.8)
            .padding()
    }
}
