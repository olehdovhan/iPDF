//
//  MergeView.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

class MergeView: UIView {
    
    var backBtn = UIButton()
    var titleLbl = UILabel()
    var purpleDescriptionLbl = UILabel()
    var tableView = UITableView()
    var mergeBtn = UIButton()
    
    
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = UIColor.white.cgColor
        setUI()
        layout()
    }
    
    func setUI() {
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
                    labelText: "Merge",
                    textColor: clr(color: .clrTitleMyFiles),
                    textAlignment: .center,
                    fontSize: 16,
                    fontWeight: .semibold)
        
        ui.setLabel(label: purpleDescriptionLbl,
                    view: self,
                    labelText: "Drag documents, to Merge file",
                    textColor: .white,
                    textAlignment: .center,
                    fontSize: 13,
                    fontWeight: .semibold,
                    backgroundColor: clr(color: .clrGreenTabTint))
        
        ui.setButton(button: mergeBtn,
                     view: self,
                     buttonText: "Merge PDF",
                     backgroundColor: clr(color: .clrGreenTabTint),
                     cornerRadius: 10,
                     textColor: .white,
                     fontSize: 16,
                     fontWeight: .semibold,
                     controlState: .normal)
        
    }
    
    func layout() {
        
        ui.universalLayout(object: backBtn,
                           parentView: self,
                           width: 60,
                           height: 22,
                           topC: hRatio(cH:23),
                           leadingC: wRatio(cW:13))
        
        ui.universalLayout(object: titleLbl,
                           parentView: self,
                           centerH: 0,
                           centerVtoO: backBtn.centerYAnchor)
        
        ui.universalLayout(object: purpleDescriptionLbl,
                           parentView: self,
                           width: w,
                           height: 40,
                           centerH: 0,
                           topToO: titleLbl.bottomAnchor,
                           topCG: 21)
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.isEditing = true
        
        ui.universalLayout(object: tableView,
                           parentView: self,
                           leadingC: wRatio(cW:15),
                           trailingC: wRatio(cW:15),
                           topToO: purpleDescriptionLbl.bottomAnchor,
                           topCG: 17,
                           bottomToO: mergeBtn.topAnchor,
                           bottomCG: 10)
        
        ui.universalLayout(object: mergeBtn,
                           parentView: self,
                           width: wRatio(cW: 172),
                           height: wRatio(cW: 54),
                           bottomC: hRatio(cH: 29),
                           leadingC: wRatio(cW: 15),
                           trailingC: hRatio(cH: 15))
        
    }
}
