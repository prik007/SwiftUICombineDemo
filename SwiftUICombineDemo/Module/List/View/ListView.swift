//
//  ListView.swift
//  SwiftUICombineDemo
//
//  Created by Khasnobis, Pritha on 03/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import SwiftUI
import UIKit

struct ListView: View {
    
   var employees = [Employee(id: "1", employeeName: "Jack Ryan", employeeSalary: "1000"),
   Employee(id: "2", employeeName: "John Snow", employeeSalary: "2000"),
   Employee(id: "3", employeeName: "John Doe", employeeSalary: "3000"),
   Employee(id: "4", employeeName: "John Cena", employeeSalary: "4000")]
    
    @State var isShowingAlert = false
    @State var isShowingSheet = false
    
    var body: some View {
        
        NavigationView {
            List(employees) { item in
                
                ZStack {
                    ItemCell(item: item)
                    NavigationLink(destination: DetailView()) {
                        EmptyView()
                    }
                }
            }
            .onAppear(){UITableView.appearance().tableFooterView = UIView()}
            .navigationBarTitle("List", displayMode: .large)
            .navigationBarItems(leading: leftButton, trailing: rightButton)
            .alert(isPresented: $isShowingAlert) {
                alert
            }
            .sheet(isPresented: $isShowingSheet) {
                Text("Sheet")
            }
        }
    }
    
    var leftButton: some View {
        Button(action: { self.isShowingSheet = true }) {
            Text("Left item")
        }
    }
    
    var rightButton: some View {
         Button(action: { self.isShowingAlert = true }) {
            Text("Right item")
        }
    }
    
    var alert: Alert {
        Alert(title: Text("Title") , message: Text("Message"), dismissButton: .default(Text("OK")))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
