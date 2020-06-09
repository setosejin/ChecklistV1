//
//  EditChecklistitemView.swift
//  ChecklistV1
//
//  Created by 김세진 on 2020/06/05.
//  Copyright © 2020 김세진. All rights reserved.
//

import SwiftUI

struct EditChecklistitemView: View {
    //Properties
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        Form{
            TextField ("Name", text: $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        }//End of Form
        .onAppear(){
            print("EditChecklistItemView has appeared!")
        }
        .onDisappear(){
            print("EditChecklistItemView has disappeared!")
        }
    }//End of body
}//End of struct

struct EditChecklistitemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistitemView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
