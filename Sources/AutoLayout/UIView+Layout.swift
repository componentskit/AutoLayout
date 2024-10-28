import UIKit

extension UIView {
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
  /// Align the view after the passed view.
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

  /// Align the view before the passed view.
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

  /// Align the view below the passed view.
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

  /// Align the view above the passed view.
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
  @discardableResult
  public func width(_ constant: CGFloat) -> LayoutConstraints {
    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.widthAnchor.constraint(equalToConstant: constant)
    constraint.isActive = true

    return LayoutConstraints(width: constraint)
  }

  @discardableResult
  public func height(_ constant: CGFloat) -> LayoutConstraints {
    self.translatesAutoresizingMaskIntoConstraints = false

    let constraint = self.heightAnchor.constraint(equalToConstant: constant)
    constraint.isActive = true

    return LayoutConstraints(height: constraint)
  }

  @discardableResult
  public func size(_ size: CGSize) -> LayoutConstraints {
    return LayoutConstraints.merged {
      self.width(size.width)
      self.height(size.height)
    }
  }

  @discardableResult
  public func size(_ constant: CGFloat) -> LayoutConstraints {
    return self.size(CGSize(width: constant, height: constant))
  }
}

extension UIView {
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
