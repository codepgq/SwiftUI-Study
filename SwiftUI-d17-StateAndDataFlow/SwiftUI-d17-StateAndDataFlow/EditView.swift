//
//  EditAlertView.swift
//  SwiftUI-d17-StateAndDataFlow
//
//  Created by pgq on 2020/3/23.
//  Copyright © 2020 pq. All rights reserved.
//

import SwiftUI

struct EditView: View {
    @Binding var value: String
    
    var input: some View {
        PQTextField(text: $value, isFirstResponder: true)
            .border(LinearGradient(gradient: Gradient(colors: [.gray]), startPoint: .zero, endPoint: UnitPoint(x: 1, y: 1)))
            .frame(height: 40)
    }
    
    var body: some View {
        VStack {
            input
            Spacer()
        }.padding()
    }
}

struct PQTextField: UIViewRepresentable {
    
    @Binding var text: String
    var isFirstResponder = false
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let tf = UITextField()
        tf.delegate = context.coordinator
        return tf
    }
    
    func updateUIView(_ textFiled: UITextField, context: Context) {
        textFiled.text = text
        if isFirstResponder {
            textFiled.becomeFirstResponder()
        }
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        let tf: PQTextField
        
        init(_ textFiled: PQTextField) {
            self.tf = textFiled
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            tf.text = textField.text ?? ""
        }
    }
}
