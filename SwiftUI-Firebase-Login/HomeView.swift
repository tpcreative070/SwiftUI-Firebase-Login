//
//  HomeView.swift
//  SwiftUI-Firebase-Login
//
//  Created by phong070 on 16/09/2023.
//
import SwiftUI

import Foundation
struct HomeView :  View {
    @Environment(\.dismiss) var dismiss
    @State private var showSheet : Bool = false
    var body : some View {
        NavigationStack{
            VStack {
                Text("Token \(UserHelper.instance.token())")
                Button("Sign out"){
                    UserHelper.instance.signout()
                    showSheet.toggle()
                }
                .padding(.top, 20)
                .fullScreenCover(isPresented:$showSheet){
                    SigninView().onDisappear(){
                        print("onDisappear \(showSheet)")
                    }
                }
            }
        }
       .onDisappear(){
            dismiss()
        }
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

