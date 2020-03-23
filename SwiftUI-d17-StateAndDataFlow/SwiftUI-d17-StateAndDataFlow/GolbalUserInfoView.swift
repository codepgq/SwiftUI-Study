//
//  EditUserInfoView.swift
//  SwiftUI-d17-StateAndDataFlow
//
//  Created by pgq on 2020/3/23.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct GolbalUserInfoView: View {
    @EnvironmentObject var data: UserInfo<Image>
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 5) {
            data.icon
                .foregroundColor(.red)
            HStack {
                NavigationLink(destination: EditView(value: self.$data.name)) {
                    Text("name: \(data.name)")
                }
            }

            HStack {
                NavigationLink(destination: EditView(value: self.$data.age)) {
                    Text("age: \(data.age)")
                }
            }

            HStack {
                NavigationLink(destination: EditView(value: self.$data.address)) {
                    Text("address: \(data.address)")
                }
            }
            Spacer()
        }.padding()
        .navigationBarTitle("全局修改")
    }
}

struct EditUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GolbalUserInfoView()
    }
}
