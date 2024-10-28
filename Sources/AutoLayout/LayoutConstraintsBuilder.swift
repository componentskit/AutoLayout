/// A result builder for merging multiple ``LayoutConstraints`` into a single ``LayoutConstraints``.
///
/// NOTE: If two elements have the same non-nil constraint, the result will contain the constraint of the latest element.
@resultBuilder
public struct LayoutConstraintsBuilder {
  public static func buildBlock(_ constraints: LayoutConstraints...) -> LayoutConstraints {
    constraints.reduce(into: LayoutConstraints()) { partialResult, constraints in
      if let top = constraints.top {
        partialResult.top = top
      }
      if let leading = constraints.leading {
        partialResult.leading = leading
      }
      if let bottom = constraints.bottom {
        partialResult.bottom = bottom
      }
      if let trailing = constraints.trailing {
        partialResult.trailing = trailing
      }
      if let vertical = constraints.vertical {
        partialResult.vertical = vertical
      }
      if let horizontal = constraints.horizontal {
        partialResult.horizontal = horizontal
      }
      if let width = constraints.width {
        partialResult.width = width
      }
      if let height = constraints.height {
        partialResult.height = height
      }
    }
  }
}
