//
//  SectionView.swift
//  SwiftUI-d7-ContainerViews
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    var body: some View {
        VStack {
            Section(footer: Text("fotter1")) {
                List {
                    Text("01")
                    Text("02")
                    Text("03")
                    Text("04")
                    
                }.background(Color.red)
            }
            
            Section(header: Text("header1").italic()) {
                List {
                    Text("a")
                    Text("b")
                    Text("c")
                    Text("d")
                    
                }
            }.background(Color.green)
            
            
            Section(header: Text("header2").bold(), footer: Text("fotter2")) {
                List {
                    Text("01")
                    Text("02")
                    Text("03")
                    Text("04")
                    
                }
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
