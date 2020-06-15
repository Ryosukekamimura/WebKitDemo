//
//  ContentView.swift
//  WebKitSwiftUIDemo
//
//  Created by 神村亮佑 on 2020/06/15.
//  Copyright © 2020 神村亮佑. All rights reserved.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    @State private var urlString:String = "https://www.apple.com"
    @State var isCheck:Bool = true
    
    
    
    
    
    
    
    var body: some View {
        VStack{
            HStack{
                Button(action:{
                    print("show url")
                    self.isCheck.toggle()
                    if self.isCheck == false{
                        self.urlString = "https://www.google.com"
                    }else{
                        self.urlString = "https://www.youtube.com"
                    }
                }){
                    Text("お気に入り")
                }
                Text(urlString)
            }
            WebView(url: URL(string: urlString)!)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WebView: UIViewRepresentable{
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
