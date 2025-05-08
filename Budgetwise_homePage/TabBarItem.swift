import SwiftUI

 struct TabBarItem: View {
 let icon: Image
 let selectedIcon: Image?
 let label: String
 let isSelected: Bool
 let selectedColor: Color
 
 var body: some View {
 VStack(spacing: 4) {
 (isSelected ? (selectedIcon ?? icon) : icon)
 .renderingMode(.template)
 .resizable()
 .scaledToFit()
 .frame(width: 24, height: 24)
 .foregroundColor(isSelected ? Color(red: 82/255, green: 130/255, blue: 226/255) : .black)
 .opacity(isSelected ? 1.0 : 0.6)
 
 Text(label)
 .font(.system(size: 12))
 .foregroundColor(isSelected ? Color(red: 82/255, green: 130/255, blue: 226/255) : .black)
 }
 }
 }

