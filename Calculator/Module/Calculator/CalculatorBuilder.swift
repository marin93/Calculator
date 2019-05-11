//Generated by Mota

import UIKit

final class CalculatorBuilder {
    func buildView() -> CalculatorViewController {
        let nib = UINib(nibName: "CalculatorViewController", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil).first
        guard let viewController = view as? CalculatorViewController else {
            fatalError("Expected to have view controller at this point")
        }
        let viewModel = CalculatorViewModel()
        viewController.viewModel = viewModel
        viewModel.delegate = viewController
        return viewController
    }
}
