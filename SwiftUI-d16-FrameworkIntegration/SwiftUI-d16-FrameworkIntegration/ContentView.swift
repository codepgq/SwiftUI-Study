//
//  ContentView.swift
//  SwiftUI-d16-FrameworkIntegration
//
//  Created by pgq on 2020/3/21.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        VStack(alignment: .center) {
            TextField("请输入", text: $text)
            Text("下面的View用的是UILabel桥接过来的")
                .frame(height: 20)
            MyView(haha: $text)
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyView: UIViewRepresentable {
    @Binding var haha: String
    func makeUIView(context: Context) -> UILabel {
        return UILabel()
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = haha
    }
    
    func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }
    
    class Coordinator: NSObject {
        var control: MyView

        init(_ control: MyView) {
            self.control = control
        }

        @objc
        func updateCurrentPage(sender: UILabel) {
            control.haha = sender.text ?? ""
        }
    }
}
