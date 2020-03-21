//
//  GroupView.swift
//  SwiftUI-d7-ContainerViews
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct GroupView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Group {
               Text("AA")
                Text("BB")
                Button(action: {}) {
                    Text("button")
                }
            }

            Group {
                Text("AA")
                Text("BB")
                Button(action: {}) {
                    Text("button")
                }
            }
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
