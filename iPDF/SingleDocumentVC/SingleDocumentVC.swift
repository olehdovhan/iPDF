//
//  SingleDocumentVC.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

class SingleDocumentVC: UIViewController {
    
    var vw = SingleDocumentVw()
    var modelIndex: Int
    var currentModel: AlternateMixModel {
        get{
            AlternateMixStorage.shared.alternatedModels[modelIndex]
        }
        set {
            AlternateMixStorage.shared.alternatedModels.remove(at: modelIndex)
            AlternateMixStorage.shared.alternatedModels.insert(newValue, at: modelIndex)
        }
    }
    
    init(index: Int) {
        self.modelIndex = index
        let maxValue = AlternateMixStorage.shared.alternatedModels[modelIndex].pages.count
        vw.plusMinusStepper.maximumValue = Double(maxValue)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(vw)
        vw.frame = view.bounds
        addTargets()
    }
    
    private func addTargets() {
        vw.backBtn.addTarget(self, action: #selector(leaveCurrentVC), for: .touchUpInside)
        vw.plusMinusStepper.addTarget(self, action: #selector(changePagesCount(by:)), for: .touchUpInside)
        vw.reverseReorderCtrl.addTarget(self, action: #selector(changeBoolOrder(sgmntd:)), for: .valueChanged)
      }
    
    func reverseOrder<T>(array: [T]) -> [T] {
        let reversedTuple = Array(array.enumerated().reversed())
        var reverseArray = [T]()
        for (_, element) in reversedTuple {
            reverseArray.append(element)
        }
        return reverseArray
    }
 
    @objc private func changeBoolOrder(sgmntd: UISegmentedControl) {
        currentModel.reverse = sgmntd.selectedSegmentIndex == 0 ? false : true
        print(currentModel.reverse)
        currentModel.pages = reverseOrder(array: currentModel.pages)
        print(currentModel.pages)
    }
    
    @objc private func changePagesCount(by stepper: UIStepper) {
        vw.numberLbl.text = String(Int(stepper.value))
        currentModel.afterPage = Int(stepper.value)
        
    }
}
