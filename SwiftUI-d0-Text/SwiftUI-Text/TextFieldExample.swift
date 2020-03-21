//
//  TextFieldExample.swift
//  SwiftUI-Text
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct TextFieldExample: View {
    @State var text: String
    
    var body: some View {
        VStack {
            Text("\(text)")
                .foregroundColor(.gray)
                .background(Color.red)
            TextField("account", text: $text)
                /**
                 DefaultTextFieldStyle 啥都没有
                 PlainTextFieldStyle 这个和上面的一样
                 RoundedBorderTextFieldStyle 圆角边框
                 SquareBorderTextFieldStyle 不可以用在iOS上面
                 */
                .textFieldStyle(RoundedBorderTextFieldStyle())
                // 添加阴影
                .shadow(color: .gray, radius: 10)
                .accessibility(hint: Text("事实上"))
            Spacer()
        }.padding()
        .navigationBarTitle(Text("输入框"))
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct TextFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExample(text: "")
    }
}
