//
//  TextExample.swift
//  SwiftUI-Text
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        Text("SwiftUI提供了用于声明应用程序用户界面的视图，控件和布局结构。该框架提供事件处理程序，用于向您的应用程序传递敲击，手势和其他类型的输入，并提供工具来管理从应用程序模型到用户将看到并与之交互的视图和控件的数据流。\n创建您自己的符合View协议的自定义视图，并使用SwiftUI视图将其组合起来，以使用堆栈，列表等显示文本，图像和自定义形状。将强大的修改器应用于内置视图和您自己的视图，以自定义其渲染和交互性。可以在多个平台上的应用程序之间共享代码，这些视图和控件可以适应其上下文和表示形式。")
            // 文字颜色
            .foregroundColor(.black)
            // 加粗
            .bold()
            // 斜体
            .italic()
            // 删除线
            .strikethrough(true, color: .red)
            // 下划线
            .underline(true, color: .green)
            // 文字间距
            .kerning(2)
            .tracking(4)
            .baselineOffset(4)
            /** 如果超出文本宽度，是怎么显示
             head ...aaaa
             middle aa...aa
             tail aaaa...
             */
            //            .truncationMode(.tail)
            // 设置行数，默认是自动扩张
            //            .lineLimit(2)
        
            .lineLimit(1)
            // 间距
            .padding()
    }
}

struct TextExample_Previews: PreviewProvider {
    static var previews: some View {
        TextExample()
    }
}
