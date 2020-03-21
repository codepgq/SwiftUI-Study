//
//  PaintsStylesGradients.swift
//  SwiftUI-d15-DrawingAndAnimation
//
//  Created by pgq on 2020/3/20.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct PaintsStylesGradients: View {
    var body: some View {
        List {
            Row(title: "Color") {
                Text("blue").foregroundColor(.blue)
            }
            
            Row(title: "ImagePaint") {
                Rectangle()
                    .fill(ImagePaint(image: Image("xx").resizable(), sourceRect: CGRect(x: 0, y: 0, width: 100, height: 100), scale: 0.4))
            }
            Text("其他的基本都在前面的例子中使用到，这里不做显示了")
        }
    }
}

struct PaintsStylesGradients_Previews: PreviewProvider {
    static var previews: some View {
        PaintsStylesGradients()
    }
}
