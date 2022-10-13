//
//  LessonModel.swift
//  M5WrapUpChallenge
//
//  Created by John Deranian on 10/9/22.
//

import Foundation
import SwiftUI

class LessonModel: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var lessons = [Lesson]()
    @Published var titles = [String]()
    
    init() {
        
        // Parse local included json data
        getLocalData()
        createListOfTitles()

        //FIXME: setup json file on drano.net
        // Download remote json file and parse data
        //getRemoteData()
    }
    
    // MARK: - Data methods
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "Data", withExtension: "json")
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let lessons = try jsonDecoder.decode([Lesson].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.lessons = lessons
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
    }
    
    func gotoHomePage() {
        path.removeLast(path.count)
    }
    
    func createListOfTitles() {
        //var titles: [String]
        for lesson in lessons {
            titles.append(lesson.title)
        }
    }
}
