//
//  ContentView.swift
//  M5WrapUpChallenge
//
//  Created by John Deranian on 10/9/22.
//
// this is close https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-a-search-bar-to-filter-your-data
// for add the searchable to the navigation

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var lessonModel: LessonModel
    
    @State private var isEditing = false
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationStack(path: $lessonModel.path) {
            
            List {
                
                ForEach(lessonModel.lessons) { lesson in
                //ForEach(searchResults, id: \.self) { lesson in
                    NavigationLink(value: lesson) {
                        VStack(alignment: .leading) {
                            Text(lesson.title)
                                .bold()
                        }
                    }
                }
            }.foregroundColor(.brown)
                .navigationTitle("Welcome to Swift")
                .navigationDestination(for: Lesson.self) { lesson in LessonDetailView(lesson: lesson)
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
                    ForEach(searchResults, id: \.self) { result in
                        Text("Are you looking for \(result)?").searchCompletion(result)
                    }
                }
            
            
            
            //.frame(maxWidth: .infinity)
            // Found this at https://stackoverflow.com/questions/68093282/remove-top-padding-from-list-in-swiftui
            // expands the list to the parent
                .listStyle(.grouped)
                .onAppear {
                    let tableHeaderView = UIView(frame: .zero)
                    tableHeaderView.frame.size.height = 1
                    UITableView.appearance().tableHeaderView = tableHeaderView
                }
        }
        .onSubmit(of: .search, runSearch)
//        .onChange(of: searchText) { index in
//             if !index.isEmpty {
//                 searchCollection = lessonModel.titles.filter { $0.name.contains(index) }
//             } else {
//                 searchCollection = collections
//             }
        
        
              .onChange(of: searchText) { _ in runSearch() }
        
        
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return lessonModel.titles
        } else {
            return lessonModel.titles.filter { $0.contains(searchText) }
        }
    }
    
    func runSearch() {
        Task {
            
            if let url = URL(string: "https://www.google.com"),
                    UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:])
            }
        }
        
        
        
        
       // Task {
        //    LessonDetailView(lesson: lessonModel.lessons[0])
       // }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //SearchBar(text: .constant(""))
        //ContentView().environmentObject(LessonModel())
        ContentView().environmentObject(LessonModel())
    }
}
