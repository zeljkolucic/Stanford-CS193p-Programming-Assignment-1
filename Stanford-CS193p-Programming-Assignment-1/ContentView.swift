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
        
        struct Emoji: Identifiable {
            let id = UUID()
            let content: String
            
            init(_ content: String) {
                self.content = content
            }
        }
        
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
        
        var emojis: [Emoji] {
            switch self {
            case .halloween:
                [Emoji("👻"), Emoji("🎃"), Emoji("🕷️"), Emoji("😈"), Emoji("💀"), Emoji("🕸️"), Emoji("🧙"), Emoji("🙀"), Emoji("👹"), Emoji("😱"), Emoji("☠️"), Emoji("🍭")]
            case .vehicles:
                [Emoji("🚗"), Emoji("🚜"), Emoji("🚌"), Emoji("🛵"), Emoji("🛴"), Emoji("🛺"), Emoji("🚲")]
            case .fruit:
                [Emoji("🍒"), Emoji("🍓"), Emoji("🍇"), Emoji("🍎"), Emoji("🍉"), Emoji("🍋"), Emoji("🍌"), Emoji("🥝")]
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
                    let emojis = (selectedTheme.emojis + selectedTheme.emojis).shuffled()
                    ForEach(emojis) { emoji in
                        CardView(content: emoji.content)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                ForEach(Theme.allCases, id: \.self) { theme in
                    Button(action: {
                        selectedTheme = theme
                    }, label: {
                        VStack {
                            Image(systemName: selectedTheme == theme ? theme.selectedImageName : theme.imageName)
                            Text(theme.title)
                        }
                    })
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
