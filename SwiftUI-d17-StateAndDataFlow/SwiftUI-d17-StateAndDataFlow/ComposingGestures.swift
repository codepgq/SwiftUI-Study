//
//  ComposingGestures.swift
//  SwiftUI-d17-StateAndDataFlow
//
//  Created by pgq on 2020/3/24.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct ComposingGestures: View {
    var body: some View {
        VStack(spacing: 20) {
            DraggableCircle()
            
            SimultaneousGestureExample()
            
            ExclusiveGestureExample()
        }
    }
}

struct ComposingGestures_Previews: PreviewProvider {
    static var previews: some View {
        ComposingGestures()
    }
}

// MARK: - 只响应其中一个
struct ExclusiveGestureExample: View {
   enum PQState {
        case inactive
        case longPress
        case tap
        
        var isLongPress: Bool {
           self == .longPress
        }
    
        var isTap: Bool {
            self == .tap
        }
    }
    
    @GestureState var state = PQState.inactive
    var body: some View {
        let longPressGesture = LongPressGesture(minimumDuration: 1)
        .exclusively(before: TapGesture(count: 1))
            .updating($state) { (value, state, transiaction) in
                switch value {
                case .first(true):
                    state = .longPress
                case .second(_):
                    state = .tap
                default :
                    state = .inactive
                }
        }
        
        let color = (state == .inactive) ? Color.gray : (state.isLongPress ? Color.blue : Color.orange)
        return ZStack {
            Circle()
                .fill(color)
                .frame(width: 100, height: 100, alignment: .center)
            .gesture(longPressGesture)
        }
    }
}

// MARK: - 响应其中任意一个手势
struct SimultaneousGestureExample: View {
    enum PQState {
        case inactive
        case active
        
        var isActive: Bool {
           self == .active
        }
    }
    
    @GestureState var state = PQState.inactive
    var body: some View {
        let longPressGesture = LongPressGesture(minimumDuration: 0.5)
        .simultaneously(with: TapGesture())
            .updating($state, body: { (_, state, _) in
                state = .active
            })
        return ZStack {
            Circle()
                .fill(state.isActive ? Color.blue : Color.orange)
                .frame(width: 100, height: 100, alignment: .center)
            .gesture(longPressGesture)
        }
    }
}

// MARK: - 按照先后顺序响应手势
struct DraggableCircle: View {
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    @GestureState var dragState = DragState.inactive
    @State var viewState = CGSize.zero
    var body: some View {
        let minimumLongPressDuration = 0.5
        // 新建一个长按手势，并且组合一个拖拽手势
        let longPressDrag = LongPressGesture(minimumDuration: minimumLongPressDuration)
            .sequenced(before: DragGesture())
            .updating($dragState) { value, state, transaction in
                switch value {
                // Long press begins.
                case .first(true):
                    state = .pressing
                // Long press confirmed, dragging may begin.
                case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                // Dragging ended or the long press cancelled.
                default:
                    state = .inactive
                }
        }
        .onEnded { value in
            guard case .second(true, let drag?) = value else { return }
            self.viewState.width += drag.translation.width
            self.viewState.height += drag.translation.height
        }
        
        return Circle()
            .fill(dragState.isDragging ? Color.orange : Color.blue)
            .overlay(dragState.isDragging ? Circle().stroke(Color.white, lineWidth: 2) : nil)
            .frame(width: 100, height: 100, alignment: .center)
            .offset(
                x: viewState.width + dragState.translation.width,
                y: viewState.height + dragState.translation.height
            )
            .animation(nil)
            .shadow(radius: dragState.isActive ? 8 : 0)
            .animation(.linear(duration: minimumLongPressDuration))
            .gesture(longPressDrag)
            .background(Image("timg"))
    }
}
