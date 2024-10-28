import UIKit

/// A structure that holds references to various layout constraints applied to a view.
///
/// The `LayoutConstraints` struct is used to store the constraints created by layout helper methods. Each property corresponds to a specific type of constraint that has been applied.
///
/// This struct allows you to easily access and manipulate specific constraints after they have been applied to a view, facilitating adjustments or deactivations as needed.
///
/// ```swift
/// let constraints = myView.edges(16)
/// constraints.top?.constant = 20  // Adjust the top constraint's constant
/// constraints.trailing?.isActive = false  // Deactivate the trailing constraint
/// ```
public struct LayoutConstraints {
  /// The top edge constraint.
  public var top: NSLayoutConstraint?
  /// The leading edge constraint.
  public var leading: NSLayoutConstraint?
  /// The bottom edge constraint.
  public var bottom: NSLayoutConstraint?
  /// The trailing edge constraint.
  public var trailing: NSLayoutConstraint?
  /// The vertical alignment constraint (e.g., center Y).
  public var vertical: NSLayoutConstraint?
  /// The horizontal alignment constraint (e.g., center X).
  public var horizontal: NSLayoutConstraint?
  /// The width constraint.
  public var width: NSLayoutConstraint?
  /// The height constraint.
  public var height: NSLayoutConstraint?

  /// Array with all constraints.
  public var allConstraints: [NSLayoutConstraint?] {
    return [
      self.top,
      self.leading,
      self.bottom,
      self.trailing,
      self.vertical,
      self.horizontal,
      self.width,
      self.height
    ]
  }

  /// Memberwise initializer.
  public init(
    top: NSLayoutConstraint? = nil,
    leading: NSLayoutConstraint? = nil,
    bottom: NSLayoutConstraint? = nil,
    trailing: NSLayoutConstraint? = nil,
    vertical: NSLayoutConstraint? = nil,
    horizontal: NSLayoutConstraint? = nil,
    width: NSLayoutConstraint? = nil,
    height: NSLayoutConstraint? = nil
  ) {
    self.top = top
    self.leading = leading
    self.bottom = bottom
    self.trailing = trailing
    self.vertical = vertical
    self.horizontal = horizontal
    self.width = width
    self.height = height
  }

  /// Activates all existing constraints.
  public func activateAll() {
    self.allConstraints.forEach { $0?.isActive = true }
  }

  /// Deactivates all existing constraints.
  public func deactivateAll() {
    self.allConstraints.forEach { $0?.isActive = false }
  }
}
