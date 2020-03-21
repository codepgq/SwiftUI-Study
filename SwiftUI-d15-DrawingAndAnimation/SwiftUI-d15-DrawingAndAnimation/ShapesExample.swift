//
//  ShapesExample.swift
//  SwiftUI-d15-DrawingAndAnimation
//
//  Created by pgq on 2020/3/20.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ShapesExample: View {
    var body: some View {
        List {
            NavigationLink(destination: RectangleView
            ) {
                Text("矩形")
            }
            
            NavigationLink(destination: RoundedRectangleView) {
                Text("圆角矩形")
            }
            
            NavigationLink(destination: CircleView) {
                Text("圆形")
            }
            
            NavigationLink(destination: EllipseView) {
                Text("椭圆")
            }
            
            NavigationLink(destination: CapsuleView) {
                Text("Capsule 和圆角矩形类型")
            }
            
            NavigationLink(destination: PathView) {
                Text("Path 路径")
            }
        }
    }
    
    var PathView: some View {
        List {
            Row(title: "Path 路径 line") {
                Path { path in
                    path.move(to: .zero)
                    path.addLine(to: CGPoint(x: 100, y: 50))
                    
                }
                .stroke(Color.yellow)
                
            }
            
            Row(title: "Path 路径 Rectangle stroke") {
                Path { path in
                    path.addRect(CGRect(x: 10, y: 10, width: 80, height: 80))
                    
                }
                .stroke(Color.yellow)
            }
            
            Row(title: "Path 路径 Rectangle fill") {
                Path { path in
                    path.addRoundedRect(in: CGRect(x: 10, y: 10, width: 80, height: 80), cornerSize: CGSize(width: 5, height: 10))
                }
                .fill(Color.yellow)
            }
            
            Row(title: "Path 路径 ellipse fill") {
                Path { path in
                    path.addEllipse(in: CGRect(x: 10, y: 10, width: 50, height: 70))
                }
                .fill(Color.yellow)
            }
            
            Row(title: "Path 路径 ellipse stroke") {
                Path { path in
                    path.addArc(center: CGPoint(x: 50, y: 50), radius: 50, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: false)
                }
                .stroke(Color.yellow)
            }
        }
    }
    
    var CapsuleView: some View {
        List {
            Text("效果和圆角矩形类型")
            Row(title: "Capsule circular") {
                Capsule(style: .circular)
                    .background(Color.gray)
                    .foregroundColor(Color.red)
            }
            
            Row(title: "Capsule continuous") {
                Capsule(style: .continuous)
                    .background(Color.gray)
                    .foregroundColor(Color.red)
            }
        }
    }
    
    var EllipseView: some View {
        List {
            Row(title: "Ellipse") {
                Ellipse()
                .background(Color.gray)
                .foregroundColor(Color.red)
                    .frame(width: 50, height: 70)
            }
        }
    }
    
    var CircleView: some View {
        List {
            Row(title: "Circle") {
                Circle()
                .background(Color.gray)
                .foregroundColor(Color.red)
            }
            
            Row(title: "Circle Image") {
                ZStack(alignment: .bottom) {
                    Image("xx")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.orange, lineWidth: 1))
                    .shadow(radius: 10)
                    
                    Text("小白")
                        .font(.body)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom, 10)
                }
            }
        }
    }
    
    var RoundedRectangleView: some View {
        List {
            Row(title: "圆角矩形 circular") {
                RoundedRectangle(cornerSize: CGSize(width: 39, height: 40), style: .circular)
                .background(Color.gray)
                .foregroundColor(Color.red)
            }
            
            Row(title: "圆角矩形 continuous") {
                RoundedRectangle(cornerSize: CGSize(width: 39, height: 40), style: .continuous)
                    .background(Color.gray)
                    .foregroundColor(Color.red)
            }
        }
    }
    
    var RectangleView: some View {
        List {
            Row(title: "矩形 fill - LinearGradient") {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.green]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
            }
            
            Row(title: "矩形 fill - RadialGradient") {
                Rectangle()
                    .fill(RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 2, endRadius: 80))
                .edgesIgnoringSafeArea(.all)
            }
            
            Row(title: "矩形 fill - AngularGradient") {
                Rectangle()
                    .fill(AngularGradient(gradient: Gradient(colors: [.yellow, .blue]), center: .center, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 359)))
            }
            
            Row(title: "矩形 fill - Color") {
                Rectangle()
                    .fill(Color.purple)
            }
            
            Row(title: "矩形 fill - ImagePaint") {
                Rectangle()
                    .fill(ImagePaint(image: Image("xx")))
            }
            
            Row(title: "矩形 fill - Color inset(by: 10.0)") {
                Rectangle()
                    .inset(by: 10.0)
                    .background(Color.gray)
            }
            
            Row(title: "矩形 fill - Color .offset(CGSize(width: 10, height: 10))") {
                Rectangle()
                    .offset(CGSize(width: 10, height: 10))
                    .background(Color.gray)
            }
            
            Row(title: "矩形 fill - Color rotationEffect") {
                Rectangle()
                    .fill(Color.pink)
                .rotationEffect(Angle(degrees: 60))
            }
            
            Row(title: "矩形 fill - Color scale") {
                Rectangle()
                    .fill(Color.green)
                    .scaleEffect(0.8)
            }
            
            Row(title: "矩形 storkeBorder") {
                Rectangle()
                .stroke(lineWidth: 1)
            }
        }
    }
}

struct ShapesExample_Previews: PreviewProvider {
    static var previews: some View {
        ShapesExample()
    }
}

struct Row<Content: View>: View {
    let title: String
    let content: Content
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.orange)
                .font(.title)
            content
                .frame(width: 100, height: 100)
        }
    }
}
