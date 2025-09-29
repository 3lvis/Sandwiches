import SwiftUI

struct ContentView: View {
    @Bindable var store: SandwichStore

    var body: some View {
        NavigationStack {
            List {
                ForEach($store.sandwiches) { $sandwich in
                    NavigationLink(destination: SandwichDetail(sandwich: $sandwich)) {
                        SandwichCell(sandwich: sandwich)
                    }
                }
                .onMove(perform: moveSandwiches)
                .onDelete(perform: deleteSandwiches)

                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
                Button("Add", action: makeSandwich)
            }
        }
    }

    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Patty melt", ingredientCount: 3))
        }
    }

    func moveSandwiches(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }

    func deleteSandwiches(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich

    var body: some View {
        HStack {
            Image(sandwich.thumbnailName)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipped()
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(sandwich.name)
                Text("\(sandwich.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    ContentView(store: testStore)
}

