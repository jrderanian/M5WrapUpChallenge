//
//  M5WrapUpChallengeApp.swift
//  M5WrapUpChallenge
//
//  Created by John Deranian on 10/9/22.
//

import SwiftUI

@main
struct M5WrapUpChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(LessonModel())
        }
    }
}
