//
//  WebView.swift
//  SwiftUICombineStarter
//
//  Created by Khasnobis, Pritha on 19/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    var urlString = "http://www.google.com"
    
    @Binding var status: String
    
    func makeCoordinator() -> WebView.Coordinator {
        return Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
        if status == "Initial" {
            if let url = URL(string: urlString) {
                uiView.load(URLRequest(url: url))
            }
        }
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.status = "Loading"
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
             parent.status = "Loading failed"
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
             parent.status = "Loaded"
        }
    }
}
