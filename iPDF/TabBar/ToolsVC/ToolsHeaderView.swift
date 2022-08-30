//
//  ToolsHeaderView.swift
//  iPDF
//
//  Created by O l e h on 28.08.2022.
//

import UIKit

class ToolsHeaderView: UIView {
    
    let lineVw = UIView()
    let titleLbl = UILabel()
    var text: String
    
    
    init(text: String) {
        self.text = text
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = UIColor.white.cgColor
        lineVw.layer.backgroundColor = clr(color: .clrPurpleTabTint)?.cgColor
        
        ui.setLabel(label: titleLbl,
                    view: self,
                    labelText: text,
                    textColor: clr(color: .clrPurpleTabTint),
                    textAlignment: .left,
                    fontSize: 13,
                    fontWeight: .semibold)
        
        ui.lblLayout(label: titleLbl,
                     view: self,
                     height: 16,
                     leadingC: 5,
                     centerV: 0)
        
        ui.layout(vw: lineVw,
                  view: self,
                  height: 1,
                  trailingC: 0,
                  centerV: 0,
                  leadingToO: titleLbl.trailingAnchor,
                  leadingCG: 20)
    }
}
