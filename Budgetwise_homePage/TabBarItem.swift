import SwiftUI

struct TabBarItem: View {
    let icon: Image
    let label: String
    let isSelected: Bool
    let selectedColor: Color
    
    var body: some View {
        VStack(spacing: 4) {
            icon
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(isSelected ? selectedColor : .gray)
            
            Text(label)
                .font(.system(size: 12))
                .foregroundColor(isSelected ? selectedColor : .gray)
        }
    }
}

