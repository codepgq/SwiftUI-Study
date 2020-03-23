//
//  UserInfoView.swift
//  SwiftUI-d17-StateAndDataFlow
//
//  Created by pgq on 2020/3/23.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct UserInfoView: View {
    
    @State var name: String = userInfo.name
    @State var age: String = userInfo.age
    @State var address: String = userInfo.address
    @State var image: Image = userInfo.icon
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            image
                .foregroundColor(.red)
            HStack {
                NavigationLink(destination: EditView(value: $name)) {
                    Text("name: \(name)")
                }
            }
            
            HStack {
                NavigationLink(destination: EditView(value: $age)) {
                    Text("age: \(age)")
                }
            }
            
            HStack {
                NavigationLink(destination: EditView(value: $address)) {
                    Text("address: \(address)")
                }
            }
            Spacer()
        }.padding()
            .navigationBarTitle("局部同步（一级页面和二级页面数据同步）", displayMode: .inline)
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}


