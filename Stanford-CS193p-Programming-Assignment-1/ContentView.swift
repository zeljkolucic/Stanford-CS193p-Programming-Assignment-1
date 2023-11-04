//
//  ContentView.swift
//  Stanford-CS193p-Programming-Assignment-1
//
//  Created by Zeljko Lucic on 4.11.23..
//

import SwiftUI

struct ContentView: View {
    enum Theme: CaseIterable {
        case halloween
        case vehicles
        case fruit
        
        var title: String {
            switch self {
            case .halloween:
                "Halloween"
            case .vehicles:
                "Vehicles"
            case .fruit:
                "Fruit"
            }
        }
        
        var imageName: String {
            switch self {
            case .halloween:
                "ant"
            case .vehicles:
                "car"
            case .fruit:
                "carrot"
            }
        }
        
        var selectedImageName: String {
            switch self {
            case .halloween:
                "ant.fill"
            case .vehicles:
                "car.fill"
            case .fruit:
                "carrot.fill"
            }
        }
        
        var emojis: [String] {
            switch self {
            case .halloween:
                ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
            case .vehicles:
                ["🚗", "🚜", "🚌", "🛵", "🛴", "🛺", "🚲"]
            case .fruit:
                ["🍒", "🍓", "🍇", "🍎", "🍉", "🍋", "🍌", "🥝"]
            }
        }
    }
    
    @State var selectedTheme: Theme = .halloween
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
                    ForEach(selectedTheme.emojis, id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                ForEach(Theme.allCases, id: \.self) { theme in
                    Button(
                        theme.title,
                        systemImage: selectedTheme == theme ? theme.selectedImageName : theme.imageName
                    ) {
                        selectedTheme = theme
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
