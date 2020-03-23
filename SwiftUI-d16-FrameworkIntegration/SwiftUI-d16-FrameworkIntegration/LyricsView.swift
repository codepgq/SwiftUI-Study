//
//  LyricsView.swift
//  SwiftUI-d16-FrameworkIntegration
//
//  Created by pgq on 2020/3/23.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct LyricsView: View {
    var body: some View {
            Text("""
    回头吧 不要走 不要这样离开我
    恨太多 没结果 往事重提是折磨
    下半生 陪着你 怀疑快乐也不多
    没有心 别再托 好心一早放开我
    从头努力也坎坷 统统不要好过
    ......
    """)
            .padding()
                .background(Color.yellow)
        }
}

struct LyricsView_Previews: PreviewProvider {
    static var previews: some View {
        LyricsView()
    }
}
