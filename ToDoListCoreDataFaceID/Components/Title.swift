//
//  Title.swift
//  ToDoListCoreDataFaceID
//
//  Created by Marek Roslik on 23.12.21.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Authenticator")
            .bold()
            .font(.title)
            .foregroundColor(.white)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
            .background(LinearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
