//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by martin.przystalka on 10/05/2019.
//  Copyright © 2019 Martin Przystalka. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var textField: UITextField?

    var viewModel: CalculatorViewModel?

    @IBAction func onButtonClick(_ sender: Any) {
        let button = sender as? UIButton
        let input = button?.currentTitle ?? ""
        viewModel?.userDidInput(value: input)
    }
}

// MARK: - CalculatorViewModelDelegate
extension CalculatorViewController: CalculatorViewModelDelegate {
    func updateTextField(with text: String) {
        textField?.text = text
    }
}
