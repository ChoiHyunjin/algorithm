//
//  Swift3App.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/16.
//

import SwiftUI

@main
struct Swift3App: App {
    var body: some Scene {
        DocumentGroup(newDocument: Swift3Document()) { file in
            ContentView(document: file.$document)
        }
    }
}
