//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by yumi on 2022/12/7.
//

import SwiftUI
import FacebookCore

@main
struct FinalProjectApp: App {
    @State var isLogin = false
    init() {
        ApplicationDelegate.shared.application(UIApplication.shared)
    }
    var body: some Scene {
        
        WindowGroup {
            LoginView(isLogin: $isLogin)
                .onOpenURL { url in
                    ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
                }
            //用if檢查是否登入
            //把token存起來
            //            if let accessToken = AccessToken.current,
            //               !accessToken.isExpired {
            //                //                        Text("\(accessToken.userID) 登入")
            //                ContentView()
            //                    .environmentObject(DataFetcher())
            //            } else {
            //            //            ContentView()
            //            //                .environmentObject(DataFetcher())
            //            LoginView()
            //                .onOpenURL { url in
            //                    ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
            //                }
            //            }
        }
    }
    
}
