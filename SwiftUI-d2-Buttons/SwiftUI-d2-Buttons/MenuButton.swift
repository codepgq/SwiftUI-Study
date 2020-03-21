//
//  MenuButton.swift
//  SwiftUI-d2-Buttons
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct MenuButtonView: View {
    var body: some View {
        List {
            Text("只可以在macOS上面使用")
        }
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView()
    }
}
