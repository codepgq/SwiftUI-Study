//
//  ContentView.swift
//  SwiftUI-d3-ValueSelectors
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ToggleView()) {
                    Text("switch 关/开")
                }
                
                NavigationLink(destination: PickerView()) {
                    Text("Picker")
                }
                
                NavigationLink(destination: DatePickerView()) {
                    Text("DatePicker")
                }
                
                NavigationLink(destination: SliderView()) {
                    Text("Slider")
                }
                
                NavigationLink(destination: StepperView()) {
                    Text("Stepper")
                }
                }
            
            .navigationBarTitle("值的选择器")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
