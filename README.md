# SizeReader
SwiftUI size reader view modifier to access size of child view

## Usage
There are two view modifiers that you can use to obtain a size of a view
```swift
@State private var size = CGSize.zero

var body: some View {
    ContentView()
        .readSize { newSize
            // newSize will contain a size of a ContentView
        }

    ContentView()
        .readSize($size) // Or you can store it directly in binding
}
```
