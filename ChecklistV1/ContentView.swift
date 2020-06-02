//
//  ContentView.swift
//  ChecklistV1
//
//  Created by 김세진 on 2020/05/29.
//  Copyright © 2020 김세진. All rights reserved.
//

import SwiftUI


struct ChecklistView: View {
    //@State var checklistItems = ["Walk the dog", "Brush my teeth", "Learn iOS development", "Soccer practice", "Eat Ice cream"]
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog", isChecked: false),
        ChecklistItem(name: "Brush my teeth", isChecked: false),
        ChecklistItem(name: "Walk the dog", isChecked: true),
        ChecklistItem(name: "Soccer practice", isChecked: false),
        ChecklistItem(name: "Eat Ice cream", isChecked: true)
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems){
                    ChecklistItem in
                    HStack{
                        Text(ChecklistItem.name)
                        Spacer()
                        Text(ChecklistItem.isChecked ? "☑️" : "⬜️")
                    }
                    .background(Color.white)
                    .onTapGesture{
                        if let matchingIndex = self.checklistItems.firstIndex(where: { $0.id == ChecklistItem.id }) {
                            self.checklistItems[matchingIndex].isChecked.toggle()
                        }
                        self.printChecklistContents()
                        
                    }
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
        ChecklistView()
    }
}
