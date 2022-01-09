//
//  ContentView.swift
//  Shared
//
//  Created by choi hyunjin on 2022/01/09.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: SwiftTestDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(SwiftTestDocument()))
    }
}
