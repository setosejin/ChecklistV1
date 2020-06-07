//
//  NewChecklistitemView.swift
//  ChecklistV1
//
//  Created by 김세진 on 2020/06/07.
//  Copyright © 2020 김세진. All rights reserved.
//

import SwiftUI

struct NewChecklistitemView: View {
    
    var checklist : Checklist
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Add new item")
            Form{
                //Text("Endter item name")
                TextField("Enter new item name here", text: $newItemName)
                Button(action: {
                    let newChecklistItem = ChecklistItem(name: self.newItemName)
                    self.checklist.items.append(newChecklistItem)
                    self.checklist.printChecklistContents()
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }//End of HStack
                }//End of Button
                    .disabled(newItemName.count == 0)
            }//End of Form
            Text("Swipe down to cancel.")
        }//End of VStack
    }//End of body
}//End of View

struct NewChecklistitemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistitemView(checklist: Checklist())
    }
}
