import UIKit

extension UIView {
  /// Constrains the view's leading anchor to the leading anchor of another view or its superview.
  ///
  /// - Parameters:
  ///   - padding: The distance between the leading edges of the two views.
  ///   - view: The view to which the leading edge will be constrained. If `nil`, the view's superview is used.
  ///   - safeArea: A Boolean indicating whether to constrain to the `safeAreaLayoutGuide` of the other view. If `true`, the constraint respects the safe area.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the leading edge constraint.
  @discardableResult
  public func leading(
    _ padding: CGFloat = 0,
    to view: UIView? = nil,
    safeArea: Bool = false
  ) -> LayoutConstraints {
    guard let view = view ?? self.superview else {
      assertionFailure("Add \(Self.self) to a superview or pass a view as a parameter")
      return LayoutConstraints()
    }

    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.leadingAnchor.constraint(
      equalTo: safeArea
      ? view.safeAreaLayoutGuide.leadingAnchor
      : view.leadingAnchor,
      constant: padding
    )
    constraint.isActive = true

    return LayoutConstraints(leading: constraint)
  }

  /// Constrains the view's trailing anchor to the trailing anchor of another view or its superview.
  ///
  /// - Parameters:
  ///   - padding: The distance between the trailing edges of the two views.
  ///   - view: The view to which the trailing edge will be constrained. If `nil`, the view's superview is used.
  ///   - safeArea: A Boolean indicating whether to constrain to the `safeAreaLayoutGuide` of the other view. If `true`, the constraint respects the safe area.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the trailing edge constraint.
  @discardableResult
  public func trailing(
    _ padding: CGFloat = 0,
    to view: UIView? = nil,
    safeArea: Bool = false
  ) -> LayoutConstraints {
    guard let view = view ?? self.superview else {
      assertionFailure("Add \(Self.self) to a superview or pass a view as a parameter")
      return LayoutConstraints()
    }

    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.trailingAnchor.constraint(
      equalTo: safeArea
      ? view.safeAreaLayoutGuide.trailingAnchor
      : view.trailingAnchor,
      constant: -padding
    )
    constraint.isActive = true

    return LayoutConstraints(trailing: constraint)
  }

  /// Constrains the view's top anchor to the top anchor of another view or its superview.
  ///
  /// - Parameters:
  ///   - padding: The distance between the top edges of the two views.
  ///   - view: The view to which the top edge will be constrained. If `nil`, the view's superview is used.
  ///   - safeArea: A Boolean indicating whether to constrain to the `safeAreaLayoutGuide` of the other view. If `true`, the constraint respects the safe area.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the top edge constraint.
  @discardableResult
  public func top(
    _ padding: CGFloat = 0,
    to view: UIView? = nil,
    safeArea: Bool = false
  ) -> LayoutConstraints {
    guard let view = view ?? self.superview else {
      assertionFailure("Add \(Self.self) to a superview or pass a view as a parameter")
      return LayoutConstraints()
    }

    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.topAnchor.constraint(
      equalTo: safeArea
      ? view.safeAreaLayoutGuide.topAnchor
      : view.topAnchor,
      constant: padding
    )
    constraint.isActive = true

    return LayoutConstraints(top: constraint)
  }

  /// Constrains the view's bottom anchor to the bottom anchor of another view or its superview.
  ///
  /// - Parameters:
  ///   - padding: The distance between the bottom edges of the two views.
  ///   - view: The view to which the bottom edge will be constrained. If `nil`, the view's superview is used.
  ///   - safeArea: A Boolean indicating whether to constrain to the `safeAreaLayoutGuide` of the other view. If `true`, the constraint respects the safe area.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the bottom edge constraint.
  @discardableResult
  public func bottom(
    _ padding: CGFloat = 0,
    to view: UIView? = nil,
    safeArea: Bool = false
  ) -> LayoutConstraints {
    guard let view = view ?? self.superview else {
      assertionFailure("Add \(Self.self) to a superview or pass a view as a parameter")
      return LayoutConstraints()
    }

    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.bottomAnchor.constraint(
      equalTo: safeArea
      ? view.safeAreaLayoutGuide.bottomAnchor
      : view.bottomAnchor,
      constant: -padding
    )
    constraint.isActive = true

    return LayoutConstraints(bottom: constraint)
  }
}

extension UIView {
  /// Constrains the view's leading and trailing edges to those of another view or its superview, effectively stretching it horizontally.
  ///
  /// - Parameters:
  ///   - padding: The distance between the view's edges and the other view's edges.
  ///   - view: The view to which the horizontal edges will be constrained. If `nil`, the view's superview is used.
  ///   - safeArea: A Boolean indicating whether to constrain to the `safeAreaLayoutGuide` of the other view. If `true`, the constraints respect the safe area.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the leading and trailing constraints.
  @discardableResult
  public func horizontally(
    _ padding: CGFloat = 0,
    to view: UIView? = nil,
    safeArea: Bool = false
  ) -> LayoutConstraints {
    return LayoutConstraints.merged {
      self.leading(padding, to: view, safeArea: safeArea)
      self.trailing(padding, to: view, safeArea: safeArea)
    }
  }

  /// Constrains the view's top and bottom edges to those of another view or its superview, effectively stretching it vertically.
  ///
  /// - Parameters:
  ///   - padding: The distance between the view's edges and the other view's edges.
  ///   - view: The view to which the vertical edges will be constrained. If `nil`, the view's superview is used.
  ///   - safeArea: A Boolean indicating whether to constrain to the `safeAreaLayoutGuide` of the other view. If `true`, the constraints respect the safe area.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the top and bottom constraints.
  @discardableResult
  public func vertically(
    _ padding: CGFloat = 0,
    to view: UIView? = nil,
    safeArea: Bool = false
  ) -> LayoutConstraints {
    return LayoutConstraints.merged {
      self.top(padding, to: view, safeArea: safeArea)
      self.bottom(padding, to: view, safeArea: safeArea)
    }
  }
}

extension UIView {
  /// Constrains all four edges of the view to another view or its superview, optionally with padding and safe area considerations.
  ///
  /// - Parameters:
  ///   - padding: The distance between the view's edges and the other view's edges.
  ///   - view: The view to which the edges will be constrained. If `nil`, the view's superview is used.
  ///   - safeArea: A Boolean indicating whether to constrain to the `safeAreaLayoutGuide` of the other view. If `true`, the constraints respect the safe area.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing top, leading, bottom and trailing constraints.
  @discardableResult
  public func allEdges(
    _ padding: CGFloat = 0,
    in view: UIView? = nil,
    safeArea: Bool = false
  ) -> LayoutConstraints {
    return LayoutConstraints.merged {
      self.horizontally(padding, to: view, safeArea: safeArea)
      self.vertically(padding, to: view, safeArea: safeArea)
    }
  }
}

extension UIView {
  /// Constrains the view's leading anchor to the trailing anchor of another view, positioning it after the specified view horizontally.
  ///
  /// - Parameters:
  ///   - view: The view after which this view will be positioned.
  ///   - padding: The space between the trailing edge of the specified view and the leading edge of this view.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the leading edge constraint.
  @discardableResult
  public func after(
    _ view: UIView,
    padding: CGFloat = 0
  ) -> LayoutConstraints {
    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.leadingAnchor.constraint(
      equalTo: view.trailingAnchor,
      constant: padding
    )
    constraint.isActive = true

    return LayoutConstraints(leading: constraint)
  }

  /// Constrains the view's trailing anchor to the leading anchor of another view, positioning it before the specified view horizontally.
  ///
  /// - Parameters:
  ///   - view: The view before which this view will be positioned.
  ///   - padding: The space between the leading edge of the specified view and the trailing edge of this view.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the trailing edge constraint.
  @discardableResult
  public func before(
    _ view: UIView,
    padding: CGFloat = 0
  ) -> LayoutConstraints {
    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.trailingAnchor.constraint(
      equalTo: view.leadingAnchor,
      constant: -padding
    )
    constraint.isActive = true

    return LayoutConstraints(trailing: constraint)
  }

  /// Constrains the view's top anchor to the bottom anchor of another view, positioning it below the specified view vertically.
  ///
  /// - Parameters:
  ///   - view: The view below which this view will be positioned.
  ///   - padding: The space between the bottom edge of the specified view and the top edge of this view.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the top edge constraint.
  @discardableResult
  public func below(
    _ view: UIView,
    padding: CGFloat = 0
  ) -> LayoutConstraints {
    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.topAnchor.constraint(
      equalTo: view.bottomAnchor,
      constant: padding
    )
    constraint.isActive = true

    return LayoutConstraints(bottom: constraint)
  }

  /// Constrains the view's bottom anchor to the top anchor of another view, positioning it above the specified view vertically.
  ///
  /// - Parameters:
  ///   - view: The view above which this view will be positioned.
  ///   - padding: The space between the top edge of the specified view and the bottom edge of this view.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the bottom edge constraint.
  @discardableResult
  public func above(
    _ view: UIView,
    padding: CGFloat = 0
  ) -> LayoutConstraints {
    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.bottomAnchor.constraint(
      equalTo: view.topAnchor,
      constant: -padding
    )
    constraint.isActive = true

    return LayoutConstraints(top: constraint)
  }
}

extension UIView {
  /// Sets the view's width to a specific value.
  ///
  /// - Parameters:
  ///   - value: The width value.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the width constraint.
  @discardableResult
  public func width(_ constant: CGFloat) -> LayoutConstraints {
    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.widthAnchor.constraint(equalToConstant: constant)
    constraint.isActive = true

    return LayoutConstraints(width: constraint)
  }

  /// Sets the view's height to a specific value.
  ///
  /// - Parameters:
  ///   - value: The height value.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the height constraint.
  @discardableResult
  public func height(_ constant: CGFloat) -> LayoutConstraints {
    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.heightAnchor.constraint(equalToConstant: constant)
    constraint.isActive = true

    return LayoutConstraints(height: constraint)
  }

  /// Sets the view's size to specific width and height values.
  ///
  /// - Parameters:
  ///   - width: The width value.
  ///   - height: The height value.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the size constraints.
  @discardableResult
  public func size(width: CGFloat, height: CGFloat) -> LayoutConstraints {
    return LayoutConstraints.merged {
      self.width(width)
      self.height(height)
    }
  }

  /// Sets the view's size to a specific width and height value.
  ///
  /// - Parameters:
  ///   - constant: The height and width value.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the size constraints.
  @discardableResult
  public func size(_ constant: CGFloat) -> LayoutConstraints {
    return self.size(width: constant, height: constant)
  }
}

extension UIView {
  /// Constrains the view's center Y anchor to the center Y anchor of another view or its superview.
  ///
  /// - Parameters:
  ///   - offset: The vertical offset between the center Y anchors of the two views.
  ///   - view: The view to which the center Y will be constrained. If `nil`, the view's superview is used.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the center Y constraint.
  @discardableResult
  public func centerVertically(
    offset: CGFloat = 0,
    in view: UIView? = nil
  ) -> LayoutConstraints {
    guard let view = view ?? self.superview else {
      assertionFailure("Add \(Self.self) to a superview or pass a view as a parameter")
      return LayoutConstraints()
    }

    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.centerYAnchor.constraint(
      equalTo: view.centerYAnchor,
      constant: offset
    )
    constraint.isActive = true

    return LayoutConstraints(vertical: constraint)
  }

  /// Constrains the view's center X anchor to the center X anchor of another view or its superview.
  ///
  /// - Parameters:
  ///   - offset: The horizontal offset between the center X anchors of the two views.
  ///   - view: The view to which the center X will be constrained. If `nil`, the view's superview is used.
  ///
  /// - Returns: A `LayoutConstraints` object containing the center X constraint.
  @discardableResult
  public func centerHorizontally(
    offset: CGFloat = 0,
    in view: UIView? = nil
  ) -> LayoutConstraints {
    guard let view = view ?? self.superview else {
      assertionFailure("Add \(Self.self) to a superview or pass a view as a parameter")
      return LayoutConstraints()
    }

    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.centerXAnchor.constraint(
      equalTo: view.centerXAnchor,
      constant: offset
    )
    constraint.isActive = true

    return LayoutConstraints(horizontal: constraint)
  }

  /// Constrains the view's center anchors to the center anchors of another view or its superview.
  ///
  /// - Parameters:
  ///   - offset: The offset between the center anchors of the two views.
  ///   - view: The view to which the center will be constrained. If `nil`, the view's superview is used.
  ///
  /// - Returns: A ``LayoutConstraints`` object containing the center X and center Y constraint.
  @discardableResult
  public func center(
    offset: CGPoint = .zero,
    in view: UIView? = nil
  ) -> LayoutConstraints {
    return LayoutConstraints.merged {
      self.centerVertically(offset: offset.y, in: view)
      self.centerHorizontally(offset: offset.x, in: view)
    }
  }
}
