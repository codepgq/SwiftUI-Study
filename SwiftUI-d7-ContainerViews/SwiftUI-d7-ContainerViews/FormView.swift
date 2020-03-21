//
//  FormView.swift
//  SwiftUI-d7-ContainerViews
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct FormView: View {
    var body: some View {
        Form {
            Text("AA")
            Text("BB")
            Button(action: {}) {
                Text("button")
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
