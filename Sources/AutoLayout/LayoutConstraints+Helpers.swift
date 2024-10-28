extension LayoutConstraints {
  public static func merged(@LayoutConstraintsBuilder _ constraints: () -> LayoutConstraints) -> LayoutConstraints {
    return constraints()
  }
}

extension LayoutConstraints {
  public mutating func merge(with constraint: LayoutConstraints) {
    self = LayoutConstraints.merged {
      self
      constraint
    }
  }

  public mutating func merge(@LayoutConstraintsBuilder with constraints: () -> LayoutConstraints) {
    self = LayoutConstraints.merged {
      self
      constraints()
    }
  }
}
