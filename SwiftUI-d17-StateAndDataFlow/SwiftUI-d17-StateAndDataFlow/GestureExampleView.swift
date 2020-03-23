//
//  GestureExampleView.swift
//  SwiftUI-d17-StateAndDataFlow
//
//  Created by pgq on 2020/3/23.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct GestureExampleView: View {
    @State var tapPresented: Bool = false
    var body: some View {
       List {
            Text("onTapGesture").onTapGesture {
                self.tapPresented.toggle()
            }
            .alert("onTapGesture",isPresented: $tapPresented)
        
        Text("onLongPressGesture").onLongPressGesture {
                self.tapPresented.toggle()
            }
            .alert("onLongPressGesture",isPresented: $tapPresented)
        
        NavigationLink(destination: DragExample()) {
            Text("DragExample")
        }
        
        
        }
    }
}

struct GestureExampleView_Previews: PreviewProvider {
    static var previews: some View {
        GestureExampleView()
    }
}


struct DragExample: View {
    
    @State var point: CGPoint = .zero
    @State var isMoveing: Bool = false
    
    var drag: some Gesture {
        DragGesture()
            .onEnded { (value) in
                self.isMoveing = false
            }
            .onChanged { (change) in
                self.point = change.location
                self.isMoveing = true
            }
    }
    
    let text = Text("drag me")
    
    
    var body: some View {
        text
        .gesture(drag)
            .frame(width: 100, height: 100)
            .background(isMoveing ? Color.red : Color.green)
            .position(point)
    }
}
