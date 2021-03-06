//
//  LoginPhoneNumberView.swift
//  SwiftUI-project-Login
//
//  Created by pgq on 2020/3/25.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct LoginPhoneNumberView: View {
    @State private var account: String = ""
    @State private var password: String = ""
    @State private var accountIsEdit = false
    @State private var passwordIsEdit = false
    @State private var timer: Timer?
    @State private var countDown = 60
    var isPhoneNum: Bool {
        if accountIsEdit {
            return account.count == 11
        }
        return true
    }
    var isCode: Bool {
        if passwordIsEdit {
            return password.count == 4
        }
        return true
    }
    var isCanLogin: Bool {
        isPhoneNum && isCode
    }
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "phone.down.circle")
                    
                    PQTextField(placeholder: "请输入号码", maxLength: 11,text: account, onEditing: { tf in
                        self.accountIsEdit = true
                        self.account = tf.text ?? ""
                    }, onCommit:  { tf in
                        self.accountIsEdit = false
                        self.account = tf.text ?? ""
                    })
                        .keyboardType(.asciiCapableNumberPad)
                        .frame(height: 40)
                }
                if !isPhoneNum {
                    Text("手机号码应该是11位数字")
                        .font(.caption)
                        .foregroundColor(.red)
                }
                Divider()
            }
            
            VStack {
                HStack {
                    PQTextField(placeholder: "请输入验证码", maxLength: 4, text: password, onEditing: { tf in
                        self.passwordIsEdit = true
                        self.password = tf.text ?? ""
                    }, onCommit: { tf in
                        self.passwordIsEdit = false
                        self.password = tf.text ?? ""
                    })
                        .frame(height: 40)
                    Button(action: {
                        // get code
                        self.timer?.fireDate = Date.distantPast
                    }, label: {
                        Text((countDown == 60) ? "获取验证码" : "请\(countDown)s之后重试")
                    }).disabled(countDown != 60 || account.count != 11)
                }
                if !isCode {
                    Text("请输入正确的验证码(4位数字)")
                        .font(.caption)
                        .foregroundColor(.red)
                        .frame(alignment: .top)
                }
                
                Divider()
            }
            
            Button(action: {
                print("login action", self.account, self.password)
            }) {
                Text("Login")
                    .foregroundColor(.white)
            }.frame(width: 100, height: 45, alignment: .center)
                .background(isCanLogin ? Color.blue: Color.gray)
                .cornerRadius(10)
                .disabled(!isCanLogin)
            
            DismissKeyboardSpacer()
        }
        .onAppear {
            self.createTimer()
        }
        .onDisappear {
            self.invalidate()
        }
        .padding()
        
    }
    
    private func createTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
                if self.countDown < 0 {
                    self.countDown = 0
                    t.invalidate()
                }
                self.countDown -= 1
            })
            // 先不触发定时器
            timer?.fireDate = .distantFuture
        }
    }
    
    private func invalidate() {
        timer?.invalidate()
    }
    
}

struct LoginPhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPhoneNumberView()
    }
}



