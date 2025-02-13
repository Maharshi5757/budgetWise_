import SwiftUI

import SwiftUI

struct TabBarItem: View {
    let iconName: String
    let label: String
    let isSelected: Bool
    let selectedColor: Color
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(isSelected ? selectedColor : .black)
            Text(label)
                .lineLimit(1)
                .font(.caption)
                .foregroundColor(isSelected ? selectedColor : .black)
        }
        .padding(5)
        .cornerRadius(12)
    }
}

