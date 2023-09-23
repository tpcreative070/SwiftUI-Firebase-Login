//
//  ContentView.swift
//  SwiftUI-Firebase-Login
//
//  Created by phong070 on 16/09/2023.
//

import SwiftUI

struct SigninView: View {
    private var title : String = "Username"
    private var hint : String = ""
    private var icon : String = ""
    @State private var valueUsername : String = ""
    @State private var valuePassword : String = ""
    @Environment(\.dismiss) var dismiss
    @State private var showSheet : Bool = false
    @State var isLoginSuccess = false
    
    
    var body: some View {
        
        
        NavigationStack {
            ZStack {
                VStack(){
                    MyTextField(title: "Username",hint: "Enter username", icon: "ic_username", value: $valueUsername,isSecure: false,type : .emailAddress,submit: .next)
                    MyTextField(title: "Password",hint: "Enter password", icon: "ic_password", value: $valuePassword,isSecure: true,type : .default,submit: .done)
                    
                    Button {
                        UserHelper.instance.signin(email: valueUsername, password:valuePassword) { value  in
                            DispatchQueue.main.async {
                                isLoginSuccess = value
                            }
                            print("Success \(value)")
                        }
                    } label: {
                        Text("Sign in")
                            .fontWeight(.bold)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                            .foregroundColor(.white)
                    }
                    .background(.blue)
                    .cornerRadius(20)
                    .padding(.top,20)
                    
                    
                    Button {
                        showSheet.toggle()
                        print(showSheet)
                    } label: {
                        Text("Do not have an account?")
                            .font(Font.system(size: 14))
                    }.padding(.top,10)
                        .fullScreenCover(isPresented:$showSheet){
                            SignupView().onDisappear(){
                                print("onDisappear \(showSheet)")
                            }
                        }
                    
                }.padding(20)
                    .navigationTitle("Sign in")
                    .navigationDestination(isPresented: $isLoginSuccess) {
                        HomeView()
                            .onAppear(){
                                isLoginSuccess = false
                            }
                    }
                    
            }
        }
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
