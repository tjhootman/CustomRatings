import SwiftUI

struct RatingsView: View {
    let maxRating: Int
    @Binding var currentRating: Int
    let width: Int
    let symbol: String
    let color: Color
    
    init(maxRating: Int,
         currentRating: Binding<Int>,
         width: Int = 30,
         symbol: String = "star",
         color: Color = .yellow
    ) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.symbol = symbol
        self.color = color
    }
    var body: some View {
        HStack {
            Image(systemName: symbol)
                .resizable()
                .scaledToFit()
                .foregroundStyle(color)
                .symbolVariant(.slash)
                .opacity(currentRating == 0 ? 0 : 1)
                .onTapGesture {
                    currentRating = 0
                }
            ForEach(0..<maxRating, id: \.self) { rating in
                Image(systemName: symbol)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(color)
                    .symbolVariant(rating < currentRating ? .fill : .none)
                    .onTapGesture {
                        withAnimation {
                            currentRating = rating + 1
                        }
                    }
            }
        }
        .frame(width: CGFloat(maxRating * width))
    }
}

#Preview {
    struct PreviewWrapper: View {
        let maxRating: Int = 5
        @State var currentRating: Int = 2
        var body: some View {
            RatingsView(
                maxRating: maxRating,
                currentRating: $currentRating
            )
        }
    }
    return PreviewWrapper()
}
