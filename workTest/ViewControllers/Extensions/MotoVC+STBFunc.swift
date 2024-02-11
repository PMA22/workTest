//
//  MotoVC+IBA.swift
//  workTest
//
//  Created by Petra Mantičová on 11.02.2024.
//

import UIKit

// MARK: Storyboard func
extension MotoViewController: UITextFieldDelegate {
    @IBAction func viewTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    // slider
    @IBAction func engineSliderChangeValue(_ sender: UISlider) {
        msLabel.text = nil
        kmHLabel.text = nil
        engineTextField.text = String(format: "%i", Int(sender.value))
    }
    @IBAction func sliderEnd(_ sender: UISlider) {
        calculateSpeed()
    }

    // textfields
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == engineTextField {
            if let currentText = textField.text, let intValue = Int(currentText) {
                textField.text = (intValue == 0) ? "1" : (intValue > 8000 ? "8000" : currentText)
                engineSlider.value = Float(intValue)
            } else {
                textField.text = "\(String(format: "%i", Int(initialEngine)))"
                engineSlider.value = initialEngine
            }
            calculateSpeed()
        } else if textField == transmissionEngineTextField || textField == transmissionTireTextField {
            textField.text = (Double(textField.text ?? "") == 0 ||
                              Int(textField.text ?? "") == nil) ? "1" : textField.text
        } else if textField == averageTireTextField {
            textField.text = (Double(textField.text ?? "") == 0 ||
                              Double(textField.text ?? "") == nil) ? initialAverageTire : textField.text
        }
    }

    // swiftlint:disable:next line_length
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        msLabel.text = nil
        kmHLabel.text = nil
        if textField == transmissionEngineTextField || textField == transmissionTireTextField ||
            textField == engineTextField {
            // not other then number
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
            if textField == engineTextField {
                return newText?.count ?? 0 <= 4 && allowedCharacters.isSuperset(of: characterSet)
            } else {
                return newText?.count ?? 0 <= 2 && allowedCharacters.isSuperset(of: characterSet)
            }
        } else if textField == averageTireTextField {
            guard let currentText = textField.text else {
                return true
            }
            // allowed only number and .,
            let allowedCharacters = CharacterSet(charactersIn: "0123456789.")
            let characterSet = CharacterSet(charactersIn: string)
            if !characterSet.isSubset(of: allowedCharacters) {
                return false
            }

            // not second .
            if string == ".", currentText.contains(".") || currentText.isEmpty {
                return false
            }
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            // one decimal place
            let components = currentText.components(separatedBy: ".")
            if components.count == 2 {
                let decimalPart = components[1]
                return decimalPart.count <= 1 && newText.count <= 4
            }
            return newText.count <= 4
        }
        return true
    }

    // calculate buton
    @IBAction func calculateButtonClick(_ sender: UIButton) {
        view.endEditing(true)
        calculateSpeed()
    }
}
