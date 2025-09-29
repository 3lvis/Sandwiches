import SwiftUI

struct SandwichDetail: View {
    @Binding var sandwich: Sandwich
    @State private var zoomed = false

    var body: some View {
        VStack {
            Spacer(minLength: 0)

            Image(sandwich.thumbnailName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture { withAnimation { zoomed.toggle() } }

            Spacer(minLength: 0)

            if sandwich.isSpicy && !zoomed {
                HStack {
                    Spacer()
                    Label("Spicy", systemImage: "flame.fill")
                    Spacer()
                }
                .padding()
                .font(.headline.smallCaps())
                .background(Color.red)
                .foregroundStyle(Color.yellow)
                .transition(.move(edge: .bottom))
            }
        }
        .navigationTitle(sandwich.name)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    NavigationStack {
        SandwichDetail(sandwich: .constant(testData[0]))
    }
}

#Preview("Spicy example") {
    NavigationStack {
        SandwichDetail(sandwich: .constant(testData[1]))
    }
}
