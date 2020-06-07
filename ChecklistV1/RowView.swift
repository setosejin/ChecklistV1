//
//  RowView.swift
//  ChecklistV1
//
//  Created by 김세진 on 2020/06/07.
//  Copyright © 2020 김세진. All rights reserved.
//

import SwiftUI

struct RowView: View {
    
    @Binding var checklistItem: ChecklistItem
    var body: some View {
        NavigationLink(destination: EditChecklistitemView(checklistItem: $checklistItem)) {
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "☑️" : "⬜️")
            }//End of HStack
        }//End of NavigationLink
    }//End of body
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
