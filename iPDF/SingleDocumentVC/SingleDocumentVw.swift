//
//  SingleDocumentVw.swift
//  iPDF
//
//  Created by O l e h on 30.08.2022.
//

import UIKit

class SingleDocumentVw: UIView {
    
    var backBtn = UIButton()
    var saveSettingsBtn = UIButton()
    
    var titleLbl = UILabel()
    var pickPagesLbl = UILabel()
    var switchDocumentLbl = UILabel()
    var numberLbl = UILabel()
    var pagesAmountLbl = UILabel()
    
    var switchWhiteView = UIView()
    var horizontalLineOnPickView = UIView()
    var horizontalLineOnSwitchView = UIView()
    
    var reverseReorderCtrl = UISegmentedControl(items: ["Regular Order", "Reverse Order"])
    var plusMinusStepper = UIStepper()
    
    override func draw(_ rect: CGRect) {
        
        setUI()
        layout()
    }
    
    private func setUI() {
        layer.backgroundColor = UIColor.white.cgColor
        
        plusMinusStepper.minimumValue = 0
        plusMinusStepper.value = 2
        
        let conf = UIImage.SymbolConfiguration(hierarchicalColor: clr(color: .clrGreenTabTint)!)
        let img = UIImage(systemName: "chevron.left",
                          withConfiguration: conf)
        
        ui.setButton(button: backBtn,
                     view: self,
                     buttonText: "Back",
                     textColor: clr(color: .clrGreenTabTint),
                     fontSize: 16,
                     fontWeight: .semibold,
                     image: img,
                     controlState: .normal)
        
        backBtn.titleEdgeInsets = UIEdgeInsets(top: 0,
                                               left: 0,
                                               bottom: 0,
                                               right: -wRatio(cW: 10))
        
        ui.setLabel(label: titleLbl,
                    view: self,
                    labelText: "Get started with DeftPdf.pdf",
                    textColor: clr(color: .clrTitleMyFiles),
                    textAlignment: .center,
                    fontSize: 16,
                    fontWeight: .semibold)
        
        horizontalLineOnPickView.backgroundColor = clr(color: .clrLineGray)
    
        // segmented
        ui.setLabel(label: pickPagesLbl,
                    view: self,
                    labelText: "Pick pages in",
                    textColor: clr(color: .clrSegmentedText),
                    textAlignment: .left,
                    fontSize: 13,
                    fontWeight: .regular)
        
        reverseReorderCtrl.layer.cornerRadius = 10
        reverseReorderCtrl.clipsToBounds = true
        reverseReorderCtrl.selectedSegmentIndex = 0
        reverseReorderCtrl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: clr(color: .clrGreenTabTint)!], for: UIControl.State.selected)
        reverseReorderCtrl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: clr(color: .clrSegmentedText)!], for: UIControl.State.normal)
        reverseReorderCtrl.backgroundColor = clr(color: .clrSegmentedBackground)

        horizontalLineOnSwitchView.backgroundColor = clr(color: .clrLineGray)
        
        ui.setLabel(label: switchDocumentLbl,
                    view: self,
                    labelText: "Switch document after reading",
                    textColor: clr(color: .clrSegmentedText),
                    textAlignment: .left,
                    fontSize: 13,
                    fontWeight: .regular)
        
        switchWhiteView.backgroundColor = .white
        switchWhiteView.layer.cornerRadius = 10
        
        ui.shadow(object: switchWhiteView,
                  color: clr(color: .clrShadowSection),
                  radius: 2,
                  opacity: 1,
                  offset: CGSize(width: 0, height: 1))
        
        ui.setLabel(label: pagesAmountLbl,
                    view: switchWhiteView,
                    labelText: "Pages amount",
                    textColor: clr(color: .clrTitleMyFiles),
                    textAlignment: .left,
                    fontSize: 16,
                    fontWeight: .regular)
    
        ui.setLabel(label: numberLbl,
                    view: switchWhiteView,
                    labelText: "2",
                    textColor: clr(color: .clrSingleDocNumber),
                    textAlignment: .right,
                    fontSize: 17,
                    fontWeight: .regular)
        
        ui.setButton(button: saveSettingsBtn,
                     view: self,
                     buttonText: "Save Settings",
                     backgroundColor: clr(color: .clrGreenTabTint),
                     cornerRadius: 10,
                     textColor: .white,
                     fontSize: 16,
                     fontWeight: .semibold,
                     controlState: .normal)
    }
    
    private func layout() {
        
        ui.universalLayout(object: backBtn,
                           parentView: self,
                           width: 60,
                           height: 22,
                           topC: hRatio(cH:23),
                           leadingC: wRatio(cW:13))
        
        ui.universalLayout(object: titleLbl,
                           parentView: self,
                           width: wRatio(cW:230),
                           height: hRatio(cH:22),
                           centerH: 0,
                           centerVtoO: backBtn.centerYAnchor)
        
        ui.universalLayout(object: horizontalLineOnPickView,
                           parentView: self,
                           height: 1,
                           leadingC: 0,
                           trailingC: 0,
                           topToO: titleLbl.bottomAnchor,
                           topCG: 21)
        
        ui.universalLayout(object: pickPagesLbl,
                           parentView: self,
                           height: 15,
                           leadingC: 16,
                           topToO: horizontalLineOnPickView.bottomAnchor,
                           topCG: 21)
        
        ui.universalLayout(object: reverseReorderCtrl,
                           parentView: self,
                           width: wRatio(cW:359),
                           height: hRatio(cH:50),
                           centerH: 0,
                           topToO: pickPagesLbl.bottomAnchor,
                           topCG: 10)
        
        ui.universalLayout(object: horizontalLineOnSwitchView,
                           parentView: self,
                           height: 1,
                           leadingC: 0,
                           trailingC: 0,
                           topToO: reverseReorderCtrl.bottomAnchor,
                           topCG: 17)
        
        ui.universalLayout(object: switchDocumentLbl,
                           parentView: self,
                           height: 15,
                           leadingC: 16,
                           topToO: horizontalLineOnSwitchView.bottomAnchor,
                           topCG: 17)
        
        ui.universalLayout(object: switchWhiteView,
                           parentView: self,
                           width: wRatio(cW:359),
                           height: hRatio(cH:50),
                           centerH: 0,
                           topToO: switchDocumentLbl.bottomAnchor,
                           topCG: 10)
        
        ui.universalLayout(object: pagesAmountLbl,
                           parentView: switchWhiteView,
                           height: 22,
                           leadingC: 15,
                           centerV: 0,
                           leadingCG: 15)
        
        plusMinusStepper.frame = CGRect(x: .zero,
                                        y: .zero,
                                        width: wRatio(cW: 93),
                                        height: wRatio(cW: 32))
        
        ui.universalLayout(object: plusMinusStepper,
                           parentView: switchWhiteView,
                           width: wRatio(cW: 93),
                           height: wRatio(cW: 32),
                           trailingC: wRatio(cW:15),
                           centerV: 0)
        
        ui.universalLayout(object: numberLbl,
                           parentView: switchWhiteView,
                           centerVtoO: plusMinusStepper.centerYAnchor,
                           trailingToO: plusMinusStepper.leadingAnchor,
                           trailingCG: 8)
        //--
        ui.universalLayout(object: saveSettingsBtn,
                           parentView: self,
                           height: wRatio(cW: 54),
                           bottomC: hRatio(cH: 29),
                           leadingC: wRatio(cW: 15),
                           trailingC: hRatio(cH: 15))
    }
}
