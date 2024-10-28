# AutoLayout

A lightweight Swift library providing convenient Auto Layout helper methods for UIKit.

## Features

- Easy-to-use methods for common layout tasks
- Handles `translatesAutoresizingMaskIntoConstraints` automatically
- Returns constraint references for further adjustments if needed

## Installation

### Swift Package Manager

You can add `AutoLayout` to your project using Swift Package Manager. In Xcode:

1. Go to **File > Add Packages...**
2. Enter the repository URL: `https://github.com/componentskit/AutoLayout`
3. Choose the package and select **Add Package**

## Usage

### Import the Library

```swift
import AutoLayout
```

### Examples

#### Constrain a View's Edges to Its Superview

```swift
let containerView = UIView()
let subView = UIView()

containerView.addSubview(subView)
subView.allEdges(16) // Adds 16 padding on all sides
```

#### Center a View Horizontally and Vertically

```swift
subView.centerHorizontally()
subView.centerVertically()
```

#### Set Width and Height

```swift
subView.width(100)
subView.height(50)
```

#### Position a View After Another View

```swift
let firstView = UIView()
let secondView = UIView()

containerView.addSubview(firstView)
containerView.addSubview(secondView)

secondView.after(firstView, padding: 8)
```

#### Stretch a View Horizontally with Padding

```swift
subView.horizontally(20)
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.
