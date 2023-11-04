//
//  ContentView.swift
//  Stanford-CS193p-Programming-Assignment-1
//
//  Created by Zeljko Lucic on 4.11.23..
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
                ForEach(emojis, id: \.self) { emoji in
                    CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
