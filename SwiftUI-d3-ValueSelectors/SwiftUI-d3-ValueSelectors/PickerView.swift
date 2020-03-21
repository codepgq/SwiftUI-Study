//
//  PickerView.swift
//  SwiftUI-d3-ValueSelectors
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct PickerItem: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var isSelected: Bool
}

struct PickerView: View {
    var list: [PickerItem] = [
        PickerItem(id: 1, name: "a", isSelected: false),
        PickerItem(id: 2, name: "b", isSelected: false),
        PickerItem(id: 3, name: "c", isSelected: false),
        PickerItem(id: 4, name: "d", isSelected: false),
        PickerItem(id: 5, name: "e", isSelected: false),
        PickerItem(id: 6, name: "f", isSelected: false),
        PickerItem(id: 7, name: "g", isSelected: false),
    ]
    
    @State private var selectedIndex = 3
    @State private var segmentSelectedIndex = 0
    
    func picker() -> some View {
      return  VStack {
            Text("isSelected: \(self.list[selectedIndex].name)")
            Picker(selection: $selectedIndex, label: Text("标题")) {
                ForEach(0 ..< list.count) { index in
                    
                    HStack {
                        Text(self.list[index].name)
                            
                        Image(systemName: self.selectedIndex == index ? "sun.min.fill" : "sun.max.fill")
                    }
                    .foregroundColor(self.selectedIndex == index ? .red : .black)
                }
            }
        }
    }
    
    var body: some View {
        ScrollView {
            picker()
                .pickerStyle(DefaultPickerStyle())
                .frame(height: 200)
            
            Picker(selection: $segmentSelectedIndex, label: Text("标题")) {
                ForEach(0 ..< 5) { index in
                    Image(systemName: self.segmentSelectedIndex == index ? "sun.min.fill" : "sun.max.fill")
                        .foregroundColor(self.segmentSelectedIndex == index ? .red : .black)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(height: 200)
            .padding()
//            .shadow(radius: 10)
            
            picker()
            .pickerStyle(WheelPickerStyle())
            .frame(height: 200)
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
