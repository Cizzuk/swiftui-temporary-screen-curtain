# swiftui-temporary-screen-curtain

**Not for General Use.**

A swift package that adds a view modifier for displaying a temporary screen curtain, used in [CBNote](https://github.com/Cizzuk/CBNote) and [Side Search](https://github.com/Cizzuk/Side-Search).

The curtain closes when:

- Tap the curtain
- Press the ESC key on the keyboard
- Perform an accessibility Escape action
- The ScenePhase becomes inactive

## Usage

```swift
struct SampleView: View {
    @State private var showCurtain = false
    var body: some View {
        NavigationStack {
            // Some contents
        }
        .temporaryScreenCurtain(isPresented: $showCurtain)
    }
}
```

## Text to be translated

- "Close Curtain"
