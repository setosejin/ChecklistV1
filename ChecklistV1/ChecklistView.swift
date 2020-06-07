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
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items){ ChecklistItem in
                    RowView(checklistItem: ChecklistItem)
                }//End of ForEach
                    .onDelete(perform: checklist.deleteListItem)
                    .onMove(perform: checklist.moveListItem)
                
            }//End of List
            .navigationBarItems(
                leading: Button(action: { self.newChecklistItemViewIsVisible = true}){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                },
                trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.checklist.printChecklistContents()
            }
        }//End of Navigation View
            .sheet(isPresented: $newChecklistItemViewIsVisible){
                //Text("New item screen coming soon")
                NewChecklistitemView(checklist: self.checklist)
        }
    }//End of body
    
    
}//End of Content View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
