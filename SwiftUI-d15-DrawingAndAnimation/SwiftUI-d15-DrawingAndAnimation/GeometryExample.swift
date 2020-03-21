//
//  Geometry.swift
//  SwiftUI-d15-DrawingAndAnimation
//
//  Created by pgq on 2020/3/20.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct GeometryExample: View {
    var body: some View {
        List {
            
            VStack {
                Text("GeometryReader")
                geometryReaderExample
            }
        }
    }
    
    var geometryReaderExample: some View {
        VStack {
            Text("Hello")
            
            VStack {
                GeometryReader { geometry in
                    Rectangle()
                        .path(in: CGRect(x: geometry.size.width + 5, y: 0, width: geometry.size.width / 2.0, height: geometry.size.width / 2.0))
                        .fill(Color.blue)
                }
            }
            .frame(width: 150, height: 150)
            
            HStack {
                Text("SwiftUI")
                    .foregroundColor(.black).font(.title).padding(15)
                    .background(RoundedCorners(content: LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .zero, endPoint: UnitPoint(x: 1, y: 1)), tr: 30, bl: 30))
                
                Text("IUtfiwS")
                    .foregroundColor(.black).font(.title).padding(15)
                    .background(RoundedCorners(content: LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .zero, endPoint: UnitPoint(x: 1, y: 1)), tl: 30, br: 30))
            }
            .padding(20).border(Color.gray).shadow(radius:3)
        } .border(Color.black)
    }
}

struct GeometryExample_Previews: PreviewProvider {
    static var previews: some View {
        GeometryExample()
    }
}

// 一个可以自定义圆角裁剪的结构体
struct RoundedCorners<S>: View where S: ShapeStyle{
    var content: S
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height
                
                // We make sure the redius does not exceed the bounds dimensions
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                }
            .fill(self.content)
        }
    }
}
