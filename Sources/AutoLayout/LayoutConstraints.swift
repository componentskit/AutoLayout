import UIKit

/// Contains constraints of the view.
public struct LayoutConstraints {
  /// Top constraint.
  public var top: NSLayoutConstraint?
  /// Leading constraint.
  public var leading: NSLayoutConstraint?
  /// Bottom constraint.
  public var bottom: NSLayoutConstraint?
  /// Trailing constraint.
  public var trailing: NSLayoutConstraint?
  /// Vertical constraint.
  public var vertical: NSLayoutConstraint?
  /// Horizontal constraint.
  public var horizontal: NSLayoutConstraint?
  /// Width constraint.
  public var width: NSLayoutConstraint?
  /// Height constraint.
  public var height: NSLayoutConstraint?

  /// Array of all constraints.
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

  /// Activates existing constraints.
  public func activateAll() {
    self.allConstraints.forEach { $0?.isActive = true }
  }

  /// Deactivates existing constraints.
  public func deactivateAll() {
    self.allConstraints.forEach { $0?.isActive = false }
  }
}
