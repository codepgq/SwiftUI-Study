//
//  FontExample.swift
//  SwiftUI-Text
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct FontExample: View {
    
    var stylingFont: some View {
        VStack(alignment: .leading) {
            Text("monospaceDigit 等宽数字123456")
                .font(Font.title.monospacedDigit())
            
            Text("smallCaps 调整字体使用小写字母")
                .font(Font.title.smallCaps())
            
            Text("lowercaseSmallCaps 小写")
                .font(Font.title.lowercaseSmallCaps())
            
            Text("uppercaseSmallCaps 大写")
                .font(Font.title.uppercaseSmallCaps())
            
            Text("weight")
                .font(Font.title.weight(.heavy))
        }
    }
    
    var fontView: some View {
        VStack(alignment: .leading) {
            Text("largeTitle")
                .font(.largeTitle)
            
            Text("title")
                .font(.title)

            Text("headline")
                .font(.headline)

            Text("subheadline")
                .font(.subheadline)

            Text("body")
                .font(.body)

            Text("callout")
                .font(.callout)

            Text("caption")
                .font(.body)

            Text("footnote")
                .font(.footnote)

            Text("bold 加粗")
                .bold()
            
            Text("bold 倾斜")
                .italic()
        }
        
    }
    
    var body: some View {
        ScrollView {
            fontView
            stylingFont
        }
    }
}

struct FontExample_Previews: PreviewProvider {
    static var previews: some View {
        FontExample()
    }
}
