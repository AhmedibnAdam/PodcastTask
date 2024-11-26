# PodcastTask
# Dynamic Content App

## Description  
Dynamic Content App is an iOS application designed to showcase various types of audio content, such as podcasts, episodes, audiobooks, and audio articles. The app dynamically fetches and displays the latest content via an API while offering a clean and modern interface using SwiftUI and UIKit.

---

## Features  
- **Dynamic Content**: Displays updated content for podcasts, episodes, audiobooks, and audio articles.  
- **MVVM Architecture**: Ensures maintainable and testable code structure.  
- **Modern UI**:  
  - SwiftUI for a seamless and declarative interface on one screen.  
  - UIKit for robust and customizable designs on another screen.  
- **Swift Concurrency**: Handles asynchronous tasks efficiently using `async/await`.  
- **Maintainable UI Tests**: Tests are designed to be scalable and easy to modify.  

---

## Tech Stack  
- **Languages**: Swift  
- **Frameworks**: SwiftUI, UIKit  
- **Architecture**: MVVM  
- **Concurrency**: Async/Await  
- **Testing**: XCTest for UI and Unit Tests  

---

## Handling Dynamic Sections with Factory Pattern  
To handle dynamic types of sections returned from the API, the app uses the **Factory Pattern**. This allows different types of sections (e.g., podcasts, episodes, audiobooks) to be rendered differently, based on their specific type.

### Example: Podcast Section  
For podcast sections, the app uses a `PodcastSectionFactory` to determine the view layout based on the section type.

```swift
struct PodcastSectionFactory: View {
    let section: PodCastSection

    var body: some View {
        Section(header: headerView) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    SectionViewFactory.makeView(for: section)
                }
                .background(.primaryBackground)
                .padding(.horizontal, 8)
            }
            .background(.primaryBackground)
            .accessibilityIdentifier("Section_Header")
        }
    }
}

---

## Installation  
1. Clone the repository:  
   ```bash
   git clone 
