//
//  ContentView.swift
//  SwiftUI-d17-StateAndDataFlow
//
//  Created by pgq on 2020/3/23.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                stateAndDataFlow.frame(height: 300)
                GestureExampleView()
            }
            
            .navigationBarTitle("数据绑定")
        }
    }
    var stateAndDataFlow: some View {
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
