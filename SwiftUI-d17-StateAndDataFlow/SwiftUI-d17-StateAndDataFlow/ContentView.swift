//
//  ContentView.swift
//  SwiftUI-d17-StateAndDataFlow
//
//  Created by pgq on 2020/3/23.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var tapPresented: Bool = false
    @State var longPressPresented: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: UserInfoView()) {
                    Text("局部同步（一级页面和二级页面数据同步）State Binding")
                }
                
                NavigationLink(destination: GolbalUserInfoView()) {
                    Text("全局同步(environmentObject)")
                }
                
                NavigationLink(destination:configView) {
                    Text("environment 的使用")
                }
                
                NavigationLink(destination:EnvironmentValuesExample()) {
                    Text("EnvironmentValues 的使用")
                }
                
                Text("onTapGesture").onTapGesture {
                    self.tapPresented.toggle()
                }
                .alert("onTapGesture",isPresented: $tapPresented)
                
                Text("onLongPressGesture").onLongPressGesture {
                    self.longPressPresented.toggle()
                }
                .alert("onLongPressGesture",isPresented: $longPressPresented)
                
                NavigationLink(destination: DragExample()) {
                    Text("DragExample")
                }
                
                NavigationLink(destination: MagnificationGestureExample()) {
                    Text("放大/缩小手势")
                }
                
                NavigationLink(destination: RotationGestureExample()) {
                    Text("旋转手势")
                }
                
                NavigationLink(destination: ComposingGestures()) {
                    Text("组合手势")
                }
            }
                
            .navigationBarTitle("数据绑定")
        }
    }
    
    var configView: some View {
         ConfigView()
            .environment(\.lineLimit, nil)
            .environment(\.lineSpacing, 5)
            .environment(\.colorScheme, ColorScheme.dark)
            .environment(\.font, Font.callout)
    }
    
    
    @State var isPresented: Bool = false
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func alert(_ title: String, isPresented: Binding<Bool>) -> some View {
        return alert(isPresented: isPresented) { () -> Alert in
            Alert(title: Text(title), dismissButton: .cancel())
        }
    }
}
