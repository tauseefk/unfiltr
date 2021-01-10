//
//  Response.swift
//  Unfiltr
//
//  Created by Md Tauseef on 12/24/20.
//

import SwiftUI

struct Response: View {
    @State var message: String = ""

    var body: some View {
        VStack {
            TextBox { m in
                self.message = m
            }
            Text(message)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
    }
}

struct Response_Previews: PreviewProvider {
    static var previews: some View {
        Response()
    }
}
