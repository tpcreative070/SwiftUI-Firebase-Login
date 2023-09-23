//
//  SwiftUI_Firebase_LoginApp.swift
//  SwiftUI-Firebase-Login
//
//  Created by phong070 on 16/09/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import Foundation
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SwiftUI_Firebase_LoginApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            if let _ = Auth.auth().currentUser?.uid {
                HomeView()
            }else{
                SigninView()
            }
        }
    }
}

class UserHelper{
    
    static let instance = UserHelper()
    
    private init() {}
    
    func signin(email : String,password : String, callback : @escaping(Bool) -> ()){
        Auth.auth().signIn(withEmail: email, password:password) { authResult, error in
            print("\(String(describing: Auth.auth().currentUser?.uid))")
            callback(error==nil)
        }
    }
    
    func signup(email : String,password : String, callback : @escaping(Bool) -> ()){
        Auth.auth().createUser(withEmail: email, password:password) {  authResult, error in
            print("\(String(describing: Auth.auth().currentUser?.uid))")
            callback(error==nil)
        }
    }
    
    func signout(){
        do {
            try Auth.auth().signOut()
        }catch {
            print(error)
        }
    }
    
    func token() -> String{
        return Auth.auth().currentUser?.uid ?? ""
    }
}
