// LightView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вьдюшка для светов светофора
final class LightView: UIView {
    // MARK: - Life Cycle

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}
