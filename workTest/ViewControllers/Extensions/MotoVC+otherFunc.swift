//
//  MotoVC+func.swift
//  workTest
//
//  Created by Petra Mantičová on 11.02.2024.
//

import UIKit

// MARK: private func
extension MotoViewController {
    internal func startView() {
        engineSlider.value = initialEngine
        engineTextField.text = "\(String(format: "%i", Int(initialEngine)))"
        engineTextField.layer.cornerRadius = transmissionEngineTextField.frame.height / 2
        engineTextField.layer.borderColor = greenColor.cgColor
        engineTextField.layer.borderWidth = 1
        transmissionEngineTextField.text = "1"
        transmissionEngineTextField.layer.cornerRadius = transmissionEngineTextField.frame.height / 2
        transmissionEngineTextField.layer.borderColor = greenColor.cgColor
        transmissionEngineTextField.layer.borderWidth = 1
        transmissionTireTextField.text = "1"
        transmissionTireTextField.layer.cornerRadius = transmissionEngineTextField.frame.height / 2
        transmissionTireTextField.layer.borderColor = greenColor.cgColor
        transmissionTireTextField.layer.borderWidth = 1
        averageTireTextField.text = initialAverageTire
        averageTireTextField.layer.cornerRadius = transmissionEngineTextField.frame.height / 2
        averageTireTextField.layer.borderColor = greenColor.cgColor
        averageTireTextField.layer.borderWidth = 1
        calculateSpeedButton.layer.cornerRadius = calculateSpeedButton.frame.height / 2
        kmHLabel.text = nil
        msLabel.text = nil
        calculateSpeed()
    }

    internal func calculateSpeed() {
        if let engineString = engineTextField.text, let engine = Int(engineString),
           let transmissionEngineString = transmissionEngineTextField.text,
           let transmissionEngine = Int(transmissionEngineString),
            let transmissionTireString = transmissionTireTextField.text,
           let transmissionTire = Int(transmissionTireString),
            let averageTireString = averageTireTextField.text, let averageTire = Double(averageTireString) {
            let tireCircuit = averageTire * Double.pi * 2.54 // in cm (1 inch = 2,54cm)
            let transmisionRatio = Double(transmissionTire) / Double(transmissionEngine)
            let msspeed = ((Double(engine) * transmisionRatio * tireCircuit) / 6000)
            msLabel.text = String(format: "%.2f m/s", msspeed)
            kmHLabel.text = String(format: "%.2f km/h", msspeed * 3.6)
        }
    }
}
