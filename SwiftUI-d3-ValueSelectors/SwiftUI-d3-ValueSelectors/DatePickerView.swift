//
//  DatePickerView.swift
//  SwiftUI-d3-ValueSelectors
//
//  Created by pgq on 2020/3/19.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct DatePickerView: View {
    @State var date: Date = Date()
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: date)!
        let max = date
        return min...max
    }
    var body: some View {
        DatePicker(
            "请选择日期",
            selection: $date,
            in: dateRange,
            displayedComponents: .date)
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
