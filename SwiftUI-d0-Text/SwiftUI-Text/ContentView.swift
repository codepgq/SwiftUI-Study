//
//  ContentView.swift
//  SwiftUI-Text
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: TextExample()) {
                    Text("文本框")
                }
                NavigationLink(destination: TextFieldExample(text: "")) {
                    Text("文本输入框")
                }
                NavigationLink(destination: SecureFieldExample()) {
                    Text("安全文本输入框框")
                }
                
                NavigationLink(destination: FontExample()) {
                    Text("字体")
                }
            }
                
            .navigationBarTitle("Text")
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
