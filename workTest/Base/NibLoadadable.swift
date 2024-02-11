//
//  NibLoadadable.swift
//  workTest
//
//  Created by Petra Mantičová on 09.02.2024.
//

import UIKit

public protocol LoadFromNib {
    static var nibName: String { get }
}

public extension LoadFromNib where Self: UIView {
    static var nibName: String {
        return String(describing: Self.self) // class name with LoadFromNib protocol
    }

    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: Self.nibName, bundle: bundle)
    }

    func setupFromNib() {
        // swiftlint:disable:next line_length
        guard let contentView = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else { fatalError("Can't loading nib \(self)") }
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
}
