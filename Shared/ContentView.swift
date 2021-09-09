//
//  ContentView.swift
//  Shared
//
//  Created by 전상현 on 2021/09/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollViewReader { scrollProxy in
                List {
                    ForEach([1,2,3], id: \.self) { id in
                        NavigationLink("Profile \(id)", destination: ProfileView())
                    }
                }
                .navigationTitle("Profile List")
                .toolbar {
                    ToolbarItemGroup(placement: .confirmationAction, content: {
                        Button(action: {
                            print("Settings...")
                        }) {
                            Image(systemName: "gearshape.fill")
                        }
                        #if os(macOS)
                        Button(action: {
                            NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
                        }, label: {
                            Image(systemName: "sidebar.left")
                        })
                        #endif
                    })
                }
            }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("ProfileView")
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .confirmationAction, content: {
                Button("Save", action: { // <<<------------- Error
                    print("Save...")
                })
            })
        }
    }
}
