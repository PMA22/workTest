//
//  MotoViewController.swift
//  workTest
//
//  Created by PMA on 09.02.2024.
//

import UIKit

class MotoViewController: UIViewController {
    @IBOutlet weak var engineSlider: UISlider!
    @IBOutlet weak var engineTextField: UITextField!
    @IBOutlet weak var transmissionEngineTextField: UITextField!
    @IBOutlet weak var transmissionTireTextField: UITextField!
    @IBOutlet weak var averageTireTextField: UITextField!
    @IBOutlet weak var calculateSpeedButton: UIButton!
    @IBOutlet weak var kmHLabel: UILabel!
    @IBOutlet weak var msLabel: UILabel!
    @IBOutlet weak var infoView: InfoErrorView!
    // initial value
    internal let initialEngine: Float = 2000
    internal let initialAverageTire = "18"

    internal var greenColor = UIColor(red: 0/255, green: 80/255, blue: 0/255, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        startView()
    }
}
