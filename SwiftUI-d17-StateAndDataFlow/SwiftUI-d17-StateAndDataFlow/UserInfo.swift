//
//  UserInfo.swift
//  SwiftUI-d17-StateAndDataFlow
//
//  Created by pgq on 2020/3/23.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI
import Combine

final class UserInfo<Content: View>: ObservableObject {
    @Published var name: String
    @Published var age: String
    @Published var address: String
    @Published var icon: Content
    
    init(name: String,
         age: String,
         address: String,
         icon: Content) {
        self.name = name
        self.age = age
        self.address = address
        self.icon = icon
    }
}
