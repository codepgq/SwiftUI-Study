//
//  TransformedShapesExample.swift
//  SwiftUI-d15-DrawingAndAnimation
//
//  Created by pgq on 2020/3/20.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct TransformedShapesExample: View {
    var body: some View {
        List {
            Row(title: "ScaledShape") {
                Image("xx")
                .resizable()
                .scaledToFill()
                    .clipShape(ScaledShape(shape: Circle(), scale: CGSize(width: 0.8, height: 0.5), anchor: UnitPoint(x: 0.5, y: 0.5)))
            }
            
            Row(title: "ScaledShape") {
                Image("xx")
                .resizable()
                .scaledToFill()
                    .clipShape(RotatedShape(shape: Rectangle(), angle: Angle(degrees: 40), anchor: UnitPoint(x: 0.5, y: 0.5)))
            }
            
            Row(title: "OffsetShape") {
                Image("xx")
                .resizable()
                .scaledToFill()
                    .clipShape(OffsetShape(shape: Circle(), offset: CGSize(width: 10, height: 0)))
            }
            
            Row(title: "TransformedShape") {
                Image("xx")
                .resizable()
                .scaledToFill()
                    .clipShape(TransformedShape(shape: Rectangle(), transform: CGAffineTransform(scaleX: 0.5, y: 0.5).rotated(by: CGFloat.pi/180.0 * 30)))
            }
        }
    }
}

struct TransformedShapesExample_Previews: PreviewProvider {
    static var previews: some View {
        TransformedShapesExample()
    }
}
