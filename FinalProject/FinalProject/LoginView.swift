//
//  LoginView.swift
//  FinalProject
//
//  Created by yumi on 2022/12/7.
//

import SwiftUI
import FacebookLogin

struct LoginView: View {
    //儲存登入成功後得到的 token
    @Binding var isLogin:Bool
    @State var showCatPage = false
    @State var showDogPage = false
    @AppStorage("username") var userData: Data?//key(存東西 => 自己發明的型別存不進去)
    @State var username:String = "Anonymous"//預設(第一次打開app)
//    var userImage : URL
    //生成 LoginManager 物件，透過它的 function logIn 登入，當 closure 參數 result 等於 success 時表示登入成功
    var body: some View {
        ZStack{
            Image("BG3")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                .ignoresSafeArea()
            Text("尋找你要的寶貝！")
                .offset(y:-250)
                .font(.custom("jf-openhuninn-1.1", size: 30))
            Text("Hello, " + username)
                .offset(y:-285)
                .font(.custom("jf-openhuninn-1.1", size: 25))
            Button {
                let manager = LoginManager()
                manager.logIn(permissions: [.publicProfile]) { result in
                    switch result {
                    case .success(granted: let granted, declined: let declined, token: let token):
                        print("success")
                    case .cancelled:
                        print("cancelled")
                    case .failed(_):
                        print("failed")
                    }
                }
                loginControl()
            } label: {
                Text("Login")
                    .frame(width: 150, height: 50)
                    .background(Color(red:252/255,green:244/255,blue:241/255))
                    .foregroundColor(Color.black)
                    .clipShape(Capsule())
                    .font(.custom("jf-openhuninn-1.1", size: 25))
            }.offset(y:150)
        }
        .fullScreenCover(isPresented: $isLogin) {
            ChooseView(isLogin: $isLogin, username: $username)
        }
    }
    func loginControl(){
        if let accessToken = AccessToken.current,
           !accessToken.isExpired {
            isLogin = true
            Profile.loadCurrentProfile { profile, error in
                if let profile = profile {
                    username = profile.name ?? "Anonymous"
//                    userImage = profile.imageURL!
                    print(profile.name)
                    print(profile.imageURL(forMode: .square, size: CGSize(width: 300, height: 300)))
                }
            }
            let request = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name"])
            request.start { response, result, error in
                if let result = result as? [String:String] {
                    print(result)
                }
            }
        } else {
            isLogin = false
        }
    }
    //    func getProfile(){
    //        if let aToken = AccessToken.current {
    //            Profile.loadCurrentProfile { profile, error in
    //                if let profile = profile {
    //                   print(profile.name)
    //                   print(profile.imageURL(forMode: .square, size: CGSize(width: 300, height: 300)))
    //                }
    //            }
    //         }
    //    }
    // publicProfile 表示想取得使用者 FB 的公開資訊
    func logIn(permissions: [Permission] = [.publicProfile],
               viewController: UIViewController? = nil,
               completion: LoginResultBlock? = nil){
        
    }
}


//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
