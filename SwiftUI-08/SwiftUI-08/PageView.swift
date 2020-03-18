//
//  PageView.swift
//  SwiftUI-08
//
//  Created by pgq on 2020/3/18.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewcontrollers: [UIHostingController<Page>]
    @State var currentPage = 0
    
    init(_ views: [Page]) {
        self.viewcontrollers = views.map { UIHostingController(rootView: $0)}
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(controllers: viewcontrollers, currentPage: $currentPage)
            PageControl(numberOfPages: viewcontrollers.count, currentPage: $currentPage)
            .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(features.map { FeatureCard(landmark: $0)})
            .aspectRatio(3/2, contentMode: .fit)
    }
}
