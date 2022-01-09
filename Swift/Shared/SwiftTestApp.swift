//
//  SwiftTestApp.swift
//  Shared
//
//  Created by choi hyunjin on 2022/01/09.
//

import SwiftUI

@main
struct SwiftTestApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: SwiftTestDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
