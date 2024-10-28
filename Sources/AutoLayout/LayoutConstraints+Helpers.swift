extension LayoutConstraints {
  /// Merges multiple ``LayoutConstraints`` into a single ``LayoutConstraints``.
  /// 
  /// Might be useful when grouping constraints of the same view.
  /// 
  /// ```swift
  /// let constraints = LayoutConstraints.merged {
  ///   view.horizontally(16)
  ///   view.centerVertically()
  /// }
  /// ```
  /// 
  /// > Note: If two or more elements have the same non-nil constraint, the result will contain the constraint from the latest element.
  /// - Parameter constraints: Constraints that should be merged.
  /// - Returns: An instance that contains constraints from the all provided ``LayoutConstraints``.
  public static func merged(@LayoutConstraintsBuilder _ constraints: () -> LayoutConstraints) -> LayoutConstraints {
    return constraints()
  }
}

extension LayoutConstraints {
  /// Merges the provided ``LayoutConstraints`` with a current instance.
  ///
  /// > Note: If the current instance and the provided instance have the same non-nil constraint, the constraint in the current instance will be overridden with a constraint from the provided instance.
  /// - Parameter constraint: ``LayoutConstraints`` that should be merged with the current instance.
  public mutating func merge(with constraint: LayoutConstraints) {
    self = LayoutConstraints.merged {
      self
      constraint
    }
  }
  
  /// Merges the provided constraints with a current instance.
  ///
  /// Might be useful when grouping existing constraints with new values.
  ///
  /// ```swift
  /// var constraints = view.leading(10)
  /// ...
  /// constraints.merge(with: {
  ///   view.top(10)
  ///   view.bottom(20)
  /// })
  /// ```
  ///
  /// > Note: If two or more elements have the same non-nil constraint, the current instance will contain the constraint from the latest element.
  /// - Parameter constraints: Constraints that should be merged with the current instance.
  public mutating func merge(@LayoutConstraintsBuilder with constraints: () -> LayoutConstraints) {
    self = LayoutConstraints.merged {
      self
      constraints()
    }
  }
}
