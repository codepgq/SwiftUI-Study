//
//  GestureExampleView.swift
//  SwiftUI-d17-StateAndDataFlow
//
//  Created by pgq on 2020/3/23.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct DragExample: View {
    @State private var cards = [Card](repeating: Card.example, count: 10)
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            Image("timg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            HStack {
                Text("拥有三个手势，长按、单击、拖拽")
                    .font(.headline)
                    .lineLimit(nil)
                    .padding()
                    .foregroundColor(.white)
            }.position(x: 200, y: 30)
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: self.cards[index]) {
                            withAnimation {
                                self.removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: self.cards.count)
                    }
                }
            }
        }
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}


struct Card {
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}

struct CardView: View {
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    @State private var changeTextColor = false
    let card: Card
    
    var removal: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(changeTextColor ? .red : .black)
                
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(changeTextColor ? .orange : .gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(height: 250)
        .onTapGesture {
            self.isShowingAnswer.toggle()
        }
        .onLongPressGesture {
            self.changeTextColor.toggle()
        }
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
            }
                
            .onEnded { _ in
                if abs(self.offset.width) > 100 {
                    // remove the card
                    self.removal?()
                } else {
                    self.offset = .zero
                }
            }
        )
    }
}


// MARK: - 扩展
extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}


// MARK: - 放大手势
struct MagnificationGestureExample: View {
    
    @GestureState var magnifyBy = CGFloat(0.5)
    
    var magnification: some Gesture {
        MagnificationGesture()
            .updating($magnifyBy) { currentState, gestureState, transaction in
                gestureState = currentState
        }
    }
    
    var body: some View {
        ZStack {
            Image("timg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .scaleEffect(magnifyBy)
                .gesture(magnification)
        }
    }
}


// MARK: - 旋转手势
struct RotationGestureExample: View {
    @State private var angle: Angle = Angle(degrees: 0)
    
    var rotation: some Gesture {
        RotationGesture(minimumAngleDelta: angle)
            .onChanged { (angle) in
                self.angle = angle
        }.onEnded { (angle) in
            self.angle = Angle(degrees: 0)
        }
    }
    
    var body: some View {
        ZStack {
            Image("timg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .rotationEffect(angle)
                .gesture(rotation)
        }
    }
}
