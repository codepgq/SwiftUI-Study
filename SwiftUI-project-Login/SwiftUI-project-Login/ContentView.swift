//
//  ContentView.swift
//  SwiftUI-project-Login
//
//  Created by pgq on 2020/3/25.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: LoginAccountView()) {
                    Text("账户密码登录")
                }
                
                NavigationLink(destination: LoginPhoneNumberView()) {
                    Text("手机验证码登录")
                }
                
                NavigationLink(destination: TimerView()) {
                    Text("测试定时器")
                }
            }
                
            .navigationBarTitle(Text(""), displayMode: .inline)
        }
    }
}

let timer = Timer.publish (every: 1, on: .main, in: .common).autoconnect()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct TimerView: View {
    @State private var secondsElapsed = 60
    @State private var timer: Timer?
    @State private var isActive: Bool = false
    var body: some View {
        VStack {
            Text("\(self.secondsElapsed) seconds elapsed")
            Button(action: {
                self.timer?.invalidate()
            }) {
                Text("Stop Timer")
            }
            
            NavigationLink(destination: ContentView(), isActive: $isActive) {
                Text("下一级页面")
            }
        }
        .onAppear {
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
                    print("我是定时器")
                    self.secondsElapsed -= 1
                    
                    if self.secondsElapsed < 0 {
                        self.timer?.invalidate()
                    }
                })
            }
        }
        .onDisappear {
            print("onDisappear")
            if !self.isActive {
                self.timer?.invalidate()
            }
        }
        .navigationBarTitle("测试定时器")
    }
}

