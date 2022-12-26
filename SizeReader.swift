import SwiftUI

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {
    @ViewBuilder
    func readSize(_ binding: Binding<CGSize>) -> some View {
        readSize { binding.wrappedValue = $0 }
    }
    
    @ViewBuilder
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background {
            GeometryReader { g in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: g.size)
            }
        }
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

struct SizeReader_Previews: PreviewProvider {
    static var previews: some View {
        PreviewContent()
    }

    private struct PreviewContent: View {
        @State private var size = CGSize.zero

        var body: some View {
            VStack {
                VStack {
                    Color.orange
                        .frame(height: 50)

                    Color.green
                        .frame(height: 120)

                    Color.yellow
                        .frame(height: 40)

                    Color.brown
                        .frame(height: 240)
                }
                .readSize($size)

                Spacer()

                Text("Color stack size is [\(size.width, format: .number); \(size.height, format: .number)]")
            }
        }
    }
}
