//
//  InfoErrorView.swift
//  workTest
//
//  Created by Petra Mantičová on 09.02.2024.
//

//
//  InfoErrorView.swift
//  Fishsurfing
//
//  Created by PMA on 09.05.2022.
//

import UIKit

class InfoErrorView: UIView, LoadFromNib {
    @IBOutlet private weak var infoErrorView: UIView!
    @IBOutlet private weak var infoErrorLabel: UILabel!
    private var infoErrorViewTimer = Timer()
    var hideClosure: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
        customizeInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
        customizeInit()
    }

    private func customizeInit() {
        self.isHidden = true
    }

    func setInfoErrorText(text: String) {
        self.infoErrorLabel.text = text
        showInfoErrorView()
    }

    @objc private func disableInfoErrorViewAfterTime() {
        hideInfoErrorView()
    }

    @IBAction private func infoErrorViewTap(_ sender: UITapGestureRecognizer) {
        infoErrorViewTimer.invalidate()
        hideInfoErrorView()
    }

    private func showInfoErrorView() {
        infoErrorViewTimer.invalidate()
        self.isHidden = false
        self.alpha = 0
        UIView.animate(
            withDuration: 0.25,
            delay: 0,
            options: .curveEaseIn,
            animations: { self.alpha = 0.9 }, completion: nil)
        infoErrorViewTimer = Timer.scheduledTimer(
            timeInterval: 2,
            target: self,
            selector: #selector(disableInfoErrorViewAfterTime),
            userInfo: nil,
            repeats: false
        )
    }

    private func hideInfoErrorView() {
        UIView.animate(
            withDuration: 0.75,
            delay: 0,
            options: .curveEaseOut,
            animations: { self.alpha = 0.0 },
            completion: { _ in
                self.isHidden = true
                self.hideClosure?()
            }
        )
    }
}
