//
//  CardView.swift
//  Stanford-CS193p-Programming-Assignment-1
//
//  Created by Zeljko Lucic on 4.11.23..
//

import SwiftUI

struct CardView: View {
    let content: String
    
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white).strokeBorder(lineWidth: 2)
                Text(content)
            } else {
                base.fill(.orange)
            }
        }
        .foregroundStyle(.orange)
        .padding()
    }
}

#Preview {
    CardView(content: "👻")
}
