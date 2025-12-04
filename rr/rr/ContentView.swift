//
//  ContentView.swift
//  rr
//
//  Created by student on 04/12/25.
//

import SwiftUI
import SwiftData
struct NotesApp: View {
    
//    Used to perform CRUD operations
    @Environment(\.modelContext)
    private var modelContext
    @Query private var Lists: [Listt]
    var body: some View {
        NavigationStack{
            List{
                    ForEach(Lists) {
                        Lists in
                    Text(Lists.title)
                               }
            }
            .navigationTitle("My list")
            .toolbar{
                ToolbarItem(placement:.topBarTrailing){
                    Button{
                        
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .overlay{
                if Lists.isEmpty{
                    ContentUnavailableView("My lists are not available",
                        systemImage: "heart.circle",
                         description:Text("No List yest, Add one to get Start"))
                    
                }
            }
        }
    }
}

#Preview {
    NotesApp()
}

