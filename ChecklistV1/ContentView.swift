//
//  ContentView.swift
//  ChecklistV1
//
//  Created by 김세진 on 2020/05/29.
//  Copyright © 2020 김세진. All rights reserved.
//

import SwiftUI
struct ChecklistItem {
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {
    //@State var checklistItems = ["Walk the dog", "Brush my teeth", "Learn iOS development", "Soccer practice", "Eat Ice cream"]
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat Ice cream", isChecked: true)
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self.name){
                    ChecklistItem in
                    HStack{
                        Text(ChecklistItem.name)
                        Spacer()
                        if ChecklistItem.isChecked{
                            Text("✅")
                        } else {
                            Text("❎")
                        }
                    }
                        //.onTapGesture{
                            //let indexesToRemove = IndexSet(integersIn: 0...4)
                            //print("indexesToRemove=", indexesToRemove)
                            //self.checklistItems.remove(atOffsets: indexesToRemove)
                            //self.checklistItems.remove(at: 0)
                            //self.checklistItems.append(item)
                            //self.printChecklistContents()
                    //}
                }//End of ForEach
                .onDelete(perform: deleteListItem)
                    .onMove(perform: moveListItem)
            }//End of List
            .navigationBarItems(trailing: EditButton())
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
    
    func deleteListItem(whichElement: IndexSet){
        checklistItems.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int){
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
}//End of Content View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
