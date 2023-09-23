//
//  MyTextField.swift
//  SwiftUI-Firebase-Login
//
//  Created by phong070 on 16/09/2023.
//

import Foundation
import SwiftUI

struct MyTextField : View {
    var title : String
    var hint : String
    var icon : String
    @Binding var value : String
    var isSecure : Bool = false
    var type : UIKeyboardType = .default
    var submit : SubmitLabel = .next
    var body: some View {
        VStack(alignment: .leading) {
            Label{
                Text(title)
            } icon: {
                Image(icon)
            }
            if isSecure {
                SecureField(hint, text: $value)
                    .textCase(.lowercase)
                    .submitLabel(submit)
            }else{
                TextField(hint, text: $value)
                    .keyboardType(type)
                    .textCase(.lowercase)
                    .submitLabel(submit)
                    
            }
            Divider()
        }
    }
}

struct MyTextField_Previews : PreviewProvider {
    static var previews  : some View {
        MyTextField(title: "Userame", hint: "Enter username", icon: "ic_username", value: .constant(""),type : UIKeyboardType.default)
    }
}

