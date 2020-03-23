//
//  EnvironmentValuesExample.swift
//  SwiftUI-d17-StateAndDataFlow
//
//  Created by pgq on 2020/3/23.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct EnvironmentValuesExample: View {
    @Environment(\.itemsPerPage) var count
    
    var body: some View {
        Text("初始值: \(count)")
    }
}

struct EnvironmentValuesExample_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentValuesExample()
    }
}


// 新建一个Key，这个Key必须遵从EvironmentKey协议
struct ItemsPerPageKey: EnvironmentKey {
    static var defaultValue: Int = 10
}

// 扩展EnvironmentValues，这个协议就是用来为他下面的所有子View进行统一设置的
extension EnvironmentValues {
    var itemsPerPage: Int {
        get { self[ItemsPerPageKey.self] }
        set { self[ItemsPerPageKey.self] = newValue }
    }
}
