// LightView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// LightView
class LightView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}
