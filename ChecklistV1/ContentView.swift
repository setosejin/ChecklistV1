//
//  ContentView.swift
//  ChecklistV1
//
//  Created by 김세진 on 2020/05/29.
//  Copyright © 2020 김세진. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = ["Walk the dog", "Brush my teeth", "Learn iOS development", "Soccer practice", "Eat Ice cream"]
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self){
                    item in Text(item)
                        .onTapGesture{
                            let indexesToRemove = IndexSet(integersIn: 0...4)
                            print("indexesToRemove=", indexesToRemove)
                            self.checklistItems.remove(atOffsets: indexesToRemove)
                            //self.checklistItems.remove(at: 0)
                            //self.checklistItems.append(item)
                            self.printChecklistContents()
                    }
                }
            }//End of List
            .navigationBarTitle("Checklist")
                .onAppear(){
                    self.printChecklistContents()
            }
        }//End of Navigation View
    }//End of body
    
    //Method
    func printChecklistContents(){
        for item in checklistItems{
            print(item)
        }
    }
    
}//End of Content View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
