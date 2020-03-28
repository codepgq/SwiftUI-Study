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
        .onAppear {
            let subscriber = [1,2,3,4,5].publisher.mySink(
                receiveCompletion: { completion in
                    print("Completion: \(completion)")
                },
                receiveValue: { value in
                    print("Receive value: \(value)")
                    return true
                }
            )
            
            subscriber.resume()
            subscriber.resume()
            subscriber.resume()
            subscriber.resume()
            subscriber.resume()
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

protocol Resumable {
    func resume()
}

extension  Subscribers {
    
    class MySink<Input, Failure: Error>: Subscriber, Cancellable, Resumable {
        let receiveCompletion: (Subscribers.Completion<Failure>) -> Void
        let receiveValue: (Input) -> Bool
        
        var subscription: Subscription?
        var shouldPUllNewValue: Bool = false
        
        init(receiveCompletion: @escaping (Subscribers.Completion<Failure>) -> Void,
             receiveValue: @escaping (Input) -> Bool) {
            self.receiveCompletion = receiveCompletion
            self.receiveValue = receiveValue
        }
        
        // MARK: - Subscriber
        func receive(subscription: Subscription) {
            self.subscription = subscription
//            subscription.request(.unlimited)
            subscription.request(.max(1))
        }
        
        func receive(_ input: Input) -> Subscribers.Demand {
            shouldPUllNewValue = receiveValue(input)
            // 如果返回true，就继续返回
            return shouldPUllNewValue ? .max(1) : .none
        }
        
        func receive(completion: Subscribers.Completion<Failure>) {
            receiveCompletion(completion)
            subscription = nil
        }
        
        
        // MARK: - Cancellable
        func cancel() {
            subscription?.cancel()
            subscription = nil
        }
        
        
        // MARK: - backpressure Resumable
        func resume() {
            guard !shouldPUllNewValue else {
                return
            }
            shouldPUllNewValue = true
            subscription?.request(.max(1))
        }
    }
}



extension Publisher {
    func mySink(receiveCompletion: @escaping (Subscribers.Completion<Failure>) -> Void,
                receiveValue: @escaping (Output) -> Bool) -> Cancellable & Resumable {
        let sink = Subscribers.MySink<Output, Failure>(
            receiveCompletion: receiveCompletion,
            receiveValue: receiveValue
        )
        self.subscribe(sink)
        return sink
    }
}
