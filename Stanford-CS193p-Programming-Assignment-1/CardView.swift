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
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2).foregroundStyle(.red)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill(.red).opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    CardView(content: "👻")
}
