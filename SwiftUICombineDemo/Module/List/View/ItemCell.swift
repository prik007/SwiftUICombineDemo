//
//  ItemCell.swift
//  SwiftUICombineDemo
//
//  Created by Khasnobis, Pritha on 03/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import SwiftUI

struct ItemCell: View {
    
    var item: Employee
    
    var body: some View {
        HStack {
            Image(systemName: "info")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(width: 30, height: 30)
            
            VStack(alignment: .leading) {
                Text(item.employeeName ?? "").font(.headline)
                Text(item.employeeSalary ?? "").font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
        }
    }
}
