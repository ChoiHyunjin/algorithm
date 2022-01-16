//
//  ContentView.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/16.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: Swift3Document

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(Swift3Document()))
    }
}
