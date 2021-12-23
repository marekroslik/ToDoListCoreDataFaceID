//
//  ContentView.swift
//  ToDoListCoreDataFaceID
//
//  Created by Marek Roslik on 23.12.21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var authenticationManager = AuthenticationManager()
    var body: some View {
        VStack {
            LoginView()
                .environmentObject(authenticationManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $authenticationManager.showAlert) {
            Alert(title: Text("Error"), message: Text(authenticationManager.errorDescription ?? "Please try again"), dismissButton: .default(Text("Ok")))
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
}
