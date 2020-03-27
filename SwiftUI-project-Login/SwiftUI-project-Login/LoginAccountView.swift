//
//  LoginAccountView.swift
//  SwiftUI-project-Login
//
//  Created by pgq on 2020/3/25.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct LoginAccountView: View {
    @State private var account: String = ""
    @State private var password: String = ""
    @State private var showPwd = false
    
    
    var isCanLogin: Bool {
        account.count > 0 &&
        password.count > 0
    }
    var body: some View {
        VStack {
            DismissKeyboardSpacer(minLength: 10)
            HStack {
                Image(systemName: "person")
                TextField("请输入账户", text: $account)
            }.frame(height: 40)
            Divider()
            
            HStack {
                Image(systemName: "lock")
                if showPwd {
                    TextField("请输入密码", text: $password)
                } else {
                    SecureField("请输入密码", text: $password)
                }
                Button(action: {
                    self.showPwd.toggle()
                }, label: {
                    Image(systemName: self.showPwd ? "eye" : "eye.slash")
                })
            }.frame(height: 40)
            Divider()
            
            Button(action: {
                print("login action")
            }) {
                Text("Login")
                    .foregroundColor(.white)
            }.frame(width: 100, height: 45, alignment: .center)
                .background(isCanLogin ? Color.blue: Color.gray)
                .cornerRadius(10)
                .disabled(!isCanLogin)
            
            DismissKeyboardSpacer()
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct LoginAccountView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAccountView()
    }
}
