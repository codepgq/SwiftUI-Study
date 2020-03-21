//
//  ViewBuilderExample.swift
//  SwiftUI-d4-SupportingTypes
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ViewBuilderExample: View {
    @State private var notificationShow = false
    
    var body: some View {
        VStack {
            if self.notificationShow {
                NotificationView {
                    Text("显示通知")
                }
            }
            
            Spacer()
            
            Button("通知来了/隐藏通知") {
                self.notificationShow.toggle()
            }
            
            Spacer()
        }
    }
}

struct ViewBuilderExample_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderExample()
    }
}


struct NotificationView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
        .padding()
            .background(Color.yellow)
            .cornerRadius(5.0)
            .transition(.move(edge: .top))
            .animation(.spring(dampingFraction: 0.5))
        
    }
}
