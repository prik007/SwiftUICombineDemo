//
//  DetailView.swift
//  SwiftUICombineStarter
//
//  Created by Khasnobis, Pritha on 19/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @State var statusMessage = "Initial"
    
    var body: some View {
        VStack {
            Text(statusMessage)
            WebView(status: $statusMessage)
        }
    }
}
