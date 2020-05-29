//
//  ContentView.swift
//  ChecklistV1
//
//  Created by 김세진 on 2020/05/29.
//  Copyright © 2020 김세진. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("High priority")){
                    Group{
                        Text("Walk the dog")
                        Text("Brush my teeth")
                        Text("Learn iOS development")
                        Text("Make dinner")
                        Text("Do laundry")
                        Text("Pay bills")
                    }//Group으로 쪼갰지만 하나로 보임
                    Group{
                        Text("Finish homework")
                        Text("Change internet provider")
                        Text("Clean the kitchen")
                        Text("Wash the car")
                        Text("Wash the hair")
                    }
                }
                Section(header: Text("Low priority")){
                    Text("Soccer practice")
                    Text("Eat Ice cream")
                }
            }//End of List
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Checklist")
        }//End of Navigation View
    }//End of body
}//End of Content View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
