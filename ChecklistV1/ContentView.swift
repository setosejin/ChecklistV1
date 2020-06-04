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
    @ObservedObject var checklist = Checklist()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items){
                    ChecklistItem in
                    HStack{
                        Text(ChecklistItem.name)
                        Spacer()
                        Text(ChecklistItem.isChecked ? "☑️" : "⬜️")
                    }
                    .background(Color.white)
                    .onTapGesture{
                        if let matchingIndex = self.checklist.items.firstIndex(where: { $0.id == ChecklistItem.id }) {
                            self.checklist.items[matchingIndex].isChecked.toggle()
                        }
                        self.checklist.printChecklistContents()
                        
                    }
                }//End of ForEach
                    .onDelete(perform: checklist.deleteListItem)
                    .onMove(perform: checklist.moveListItem)
                
            }//End of List
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.checklist.printChecklistContents()
            }
        }//End of Navigation View
    }//End of body
    
    
}//End of Content View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
