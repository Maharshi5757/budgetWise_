import SwiftUI

struct TabBarItem: View {
    let icon: Image
    let label: String
    let isSelected: Bool
    let selectedColor: Color
    
    var body: some View {
        VStack(spacing: 4) {
            icon
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(isSelected ? Color(red: 82/255, green: 130/255, blue: 226/255) : Color(uiColor: .systemGray))
                .opacity(isSelected ? 1.0 : 0.6)
            
            Text(label)
                .font(.system(size: 12))
                .foregroundColor(isSelected ? Color(red: 82/255, green: 130/255, blue: 226/255) : Color(uiColor: .systemGray))
        }
    }
}

