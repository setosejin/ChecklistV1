//
//  ChecklistItem.swift
//  ChecklistV1
//
//  Created by 김세진 on 2020/06/02.
//  Copyright © 2020 김세진. All rights reserved.
//

import Foundation

struct ChecklistItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
