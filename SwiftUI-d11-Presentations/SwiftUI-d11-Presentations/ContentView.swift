//
//  ContentView.swift
//  SwiftUI-d11-Presentations
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented = false
    @State var isPresented2 = false
    @State var isActionSheet = false
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Button(action: {
                self.isPresented.toggle()
            }) {
                Text("Alert")
            }.alert(isPresented: self.$isPresented) {
                Alert(title: Text("需要访问你的照片库"), message: Text("你选择直接给还是马上给?"), primaryButton: Alert.Button.cancel(Text("马上给")), secondaryButton: Alert.Button.default(Text("直接给")))
            }
            
            Button(action: {
                self.isPresented2.toggle()
            }) {
                Text("Alert buttons")
            }.alert(isPresented: self.$isPresented2) {
                Alert(title: Text("需要访问你的照片库"), message: Text("你选择直接给还是马上给?"), primaryButton: Alert.Button.cancel(Text("马上给")), secondaryButton: Alert.Button.destructive(Text("直接给")))
            }
            
            Button(action: {
                self.isActionSheet.toggle()
            }) {
                Text("Action Sheet")
            }.actionSheet(isPresented: self.$isActionSheet) {
                ActionSheet(title: Text("水电费"), message: Text("我是查水表的"), buttons: [
                    ActionSheet.Button.destructive(Text("拒绝开门")),
                    ActionSheet.Button.default(Text("开门")),
                    ActionSheet.Button.cancel(Text("取消"))
                    
                ])
            }
            Spacer()
            
            EmptyView()
                .frame(width: 100, height: 100)
                .background(Color.orange)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
