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
        List {
            Text("Walk the dog")
            Text("Brush my teeth")
            Text("Learn iOS development")
            Text("Soccer practice")
            Text("Eat Ice cream")
        }//End of List
    }//End of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
