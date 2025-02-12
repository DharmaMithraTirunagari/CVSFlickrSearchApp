# 📸 Flickr Search App

A **SwiftUI-based iOS application** that allows users to **search and explore images from Flickr's public feed** using the **Flickr API**. The app features a **modern UI, smooth animations, debounced search, accessibility support, and unit/UI tests** to ensure a seamless user experience.

---

## 🎯 Features

- ✅ **Real-time Image Search** – Users can enter search keywords (e.g., `"nature"`, `"forest, bird"`) to fetch relevant images.  
- ✅ **Dynamic Grid Layout** – Images are displayed in an adaptive **grid view** with uniform spacing.  
- ✅ **Detailed Image View** – Users can click an image to see **detailed information** (title, author, published date, size).  
- ✅ **Debounced Search** – Uses **Combine framework** to optimize API calls when typing.  
- ✅ **Offline Handling** – Shows appropriate error messages if the network request fails.  
- ✅ **Smooth Transitions** – Animated **view transitions** between **Grid View and Detail View**.  
- ✅ **Accessibility Support** – Includes **VoiceOver labels** and **Dynamic Text** for better readability.  
- ✅ **Dark Mode Compatibility** – UI adapts seamlessly to light and dark modes.  
- ✅ **Error Handling** – Uses a **custom error view** with retry functionality.  
- ✅ **Unit & UI Testing** – Comprehensive **unit and UI tests** with mocks for stable performance.  

---

## 📡 API Integration

- Uses **Flickr Public Feed API** to fetch images dynamically.
- API Endpoint:
  ```
  https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags={searchTerm}
  ```
- **Comma-separated queries (`forest, bird`) are handled using OR behavior by default**.
- If we want **AND behavior**, we need to add `tagmode=all` in the API request.

---

## ScreenShots
## 📸 App Screenshots

| Home Screen | Detail View |
|------------|------------|
| <img src="https://github.com/user-attachments/assets/721f8b06-3359-4e72-a16a-55093e725c1c" width="300"> | <img src="https://github.com/user-attachments/assets/51760e07-bf8d-4515-84cd-af8eb4f4f6e5" width="300"> |


## Video Demo



https://github.com/user-attachments/assets/2ac0d315-2101-4ddf-afbf-103ddd0d6ba4



## 📂 Project Structure

```
FlickrSearchApp/
│── FlickrSearchAppApp.swift      # Main App Entry Point
│
├── Model/
│   ├── FlickrImage.swift         # Data Model for Flickr Images
│
├── Network/
│   ├── Endpoints.swift           # API Endpoint Constants
│   ├── FlickrService.swift       # API Call Logic
│   ├── MockFlickrService.swift   # API Mocking for Tests
│   ├── NetworkError.swift        # Enum for API Errors
│   ├── NetworkManager.swift      # Handles API Requests
│
├── ViewModel/
│   ├── ImageSearchViewModel.swift # Manages API Calls & UI Updates
│
├── Views/
│   ├── ImageSearchView.swift     # Main Search View
│   ├── ImageGridView.swift       # Displays Images in a Grid
│   ├── ImageDetailView.swift     # Detailed Image View
│   ├── SearchBar.swift           # Custom Search Bar
│
├── Utils/
│   ├── Constants.swift           # App Constants
│   ├── ViewExtensions.swift      # Custom View Modifiers
│
├── Tests/
│   ├── ImageSearchViewModelTests.swift   # Unit Tests for ViewModel
│   ├── MockFlickrServiceTests.swift      # Unit Tests for API Service
│
├── UITests/
│   ├── FlickrSearchAppUITests.swift      # UI Tests using XCTest
│
└── Assets/
    ├── AppIcon                    # App Icons
    ├── Preview Content             # Previews for SwiftUI
```

---

## 🛠️ Installation & Setup

### **📥 Clone the Repository**
```sh
git clone https://github.com/DharmaMithraTirunagari/CVSFlickrSearchApp.git
cd FlickrSearchApp
```

### **🛠️ Open in Xcode**
- Open `FlickrSearchApp.xcodeproj`
- Ensure **iOS 16+** is selected as the deployment target.
- Run the app on **Simulator** or a real device.

### **📦 Dependencies**
- **SwiftUI** – UI Framework  
- **Combine** – Debounced Search  
- **XCTest** – Unit Testing  

---

## 📢 How to Use

1️⃣ **Enter a search term** in the search bar.  
2️⃣ **Results appear** dynamically in a **grid view**.  
3️⃣ Tap an **image** to view **detailed information**.  
4️⃣ Click **Share** to share the image.  
5️⃣ Press **Back** to return to the grid view.  

---

## 🧪 Testing

### **✅ Running Unit Tests**
```sh
CMD + U  # Run all Unit Tests
```
- Tests include API mocking using `MockFlickrService`.
- **Test cases cover**:
  - Fetching images successfully.
  - Handling API errors correctly.
  - Ensuring debounced search works.

### **🎭 Running UI Tests**
```sh
CMD + U  # Run UI Tests
```
- Tests include:
  - Checking if **search bar** is interactive.
  - Verifying images **load correctly** in the grid.
  - Ensuring **detail view opens correctly**.

---

## 🔍 Code Quality & Best Practices

### ✅ **Performance Improvements**
- **Debounced Search**: Prevents unnecessary API calls on rapid typing.
- **Lazy Loading**: Images load only when they appear on screen.

### ✅ **Accessibility Enhancements**
- **VoiceOver Labels**: All images and buttons include `accessibilityLabel`.
- **Dynamic Text Sizing**: Supports **`dynamicTypeSize(.xSmall ... .accessibilityExtraExtraLarge)`**, ensuring text scales appropriately for users with different font size preferences.

### ✅ **Error Handling**
- **Network errors are caught gracefully** with meaningful user messages.

---

## 🛠️ Future Enhancements

🔹 **Offline Support** – Caching for better user experience.  
🔹 **Improved UI Animations** – Enhancing user interactions.  
🔹 **Dark Mode Support** – Improve accessibility for low-light environments.  

---


## 🤝 Acknowledgements

- **Flickr API** for providing public image feeds.
- **Apple's SwiftUI & Combine** for a smooth UI experience.
- **XCTest** for testing the app functionality.
