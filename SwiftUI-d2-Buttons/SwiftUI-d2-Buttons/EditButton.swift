//
//  EditButton.swift
//  SwiftUI-d2-Buttons
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct EditButtonView: View {
    var body: some View {
        VStack {
            Text("只可以在iOS上面使用")
            EditButton()
                .frame(width: 100, height: 44, alignment: .center)
                .background(Color.orange)
        }
        
    }
}

struct EditButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonView()
    }
}
