//
//  CombineReorderView.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

class CombineReorderView: UIView {
    
    var backBtn = UIButton()
    var titleLbl = UILabel()
    var purpleDescriptionLbl = UILabel()
    var saveBtn = UIButton()
    
    var areaRedoUndoVw = UIView()
    var verticalLineVw = UIView()
    var horizontalLineVw = UIView()
    var undoBtn = UIButton()
    var redoBtn = UIButton()
    var undoRedoStackView: UIStackView!
    
    var barVw = UIView()
    var addFileBarBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 78, height: 56))
    var blancPageBarBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 78, height: 56))
    var deleteBarBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 78, height: 56))
    var reorderBarBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 78, height: 56))
    var turnBarBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 78, height: 56))
    var barButtonStackView: UIStackView!
    
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = UIColor.white.cgColor
        setUI()
        layoutUI()
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
                    labelText: "Combine & Reorder",
                    textColor: clr(color: .clrTitleMyFiles),
                    textAlignment: .center,
                    fontSize: 16,
                    fontWeight: .semibold)
        
        ui.setLabel(label: purpleDescriptionLbl,
                    view: self,
                    labelText: "Select to Combine & Reorder pages",
                    textColor: .white,
                    textAlignment: .center,
                    fontSize: 13,
                    fontWeight: .semibold,
                    backgroundColor: clr(color: .clrGreenTabTint))
        
        ui.setButton(button: saveBtn,
                     view: self,
                     buttonText: "Save",
                     backgroundColor: clr(color: .clrGreenTabTint),
                     cornerRadius: 10,
                     textColor: .white,
                     fontSize: 16,
                     fontWeight: .semibold,
                     controlState: .normal)
        
        areaRedoUndoVw.backgroundColor = clr(color: .clrRedoUndoArea)
        verticalLineVw.backgroundColor = clr(color: .clrLineGray)
        horizontalLineVw.backgroundColor = clr(color: .clrLineGray)
        
        ui.setButton(button: undoBtn,
                     view: self,
                     image: image(img: .undoLight),
                     controlState: .normal)
        undoBtn.tag = 0
        redoBtn.tag = 1
        
        undoBtn.setImage(image(img: .undoDark),
                         for: .selected)
        
        ui.setButton(button: redoBtn,
                     view: self,
                     image: image(img: .redoLight),
                     controlState: .normal)
        
        redoBtn.setImage(image(img: .redoDark),
                         for: .selected)
        
        barVw.backgroundColor = .white
        ui.shadow(object: barVw,
                  color: clr(color: .clrShadowSection),
                  radius: 1,
                  opacity: 1,
                  offset: CGSize(width: 0, height: -1))
        
        undoRedoStackView = UIStackView(arrangedSubviews: [undoBtn, redoBtn])
        undoRedoStackView.axis = .horizontal
        undoRedoStackView.distribution = .fillProportionally
        
        ui.setButton(button: deleteBarBtn,
                     view: barVw,
                     buttonText: "Delete",
                     textColor: clr(color: .clrBarButtonText),
                     fontSize: wRatio(cW: 12),
                     fontWeight: .semibold,
                     image: image(img: .delete),
                     controlState: .normal)

        deleteBarBtn.alignImageAndTitleVertically()

        ui.setButton(button: turnBarBtn,
                     view: barVw,
                     buttonText: "Turn",
                     textColor: clr(color: .clrBarButtonText),
                     fontSize: wRatio(cW: 12),
                     fontWeight: .semibold,
                     image: image(img: .turn),
                     controlState: .normal)

        turnBarBtn.alignImageAndTitleVertically()
        
        ui.setButton(button: addFileBarBtn,
                     view: barVw,
                     buttonText: "Add File",
                     textColor: clr(color: .clrBarButtonText),
                     fontSize: wRatio(cW: 12),
                     fontWeight: .semibold,
                     image: image(img: .addFile),
                     controlState: .normal)

        addFileBarBtn.alignImageAndTitleVertically()
        
        ui.setButton(button: blancPageBarBtn,
                     view: barVw,
                     buttonText: "Blank Page",
                     textColor: clr(color: .clrBarButtonText),
                     fontSize: wRatio(cW: 12),
                     fontWeight: .semibold,
                     image: image(img: .blankPage),
                     controlState: .normal)
        
        blancPageBarBtn.alignImageAndTitleVertically()
        
        ui.setButton(button: reorderBarBtn,
                     view: barVw,
                     buttonText: "Reorder",
                     textColor: clr(color: .clrBarButtonText),
                     fontSize: wRatio(cW: 12),
                     fontWeight: .semibold,
                     image: image(img: .reorder),
                     controlState: .normal)
        
        reorderBarBtn.alignImageAndTitleVertically()
        
        barButtonStackView = UIStackView(arrangedSubviews: [deleteBarBtn,
                                                            turnBarBtn,
                                                            addFileBarBtn,
                                                            blancPageBarBtn,
                                                            reorderBarBtn])
        barButtonStackView.axis = .horizontal
        barButtonStackView.distribution = .fillEqually
        
    }
    
    func layoutUI(){
        
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
        
        ui.universalLayout(object: saveBtn,
                           parentView: self,
                           width: wRatio(cW: 60),
                           height: wRatio(cW: 30),
                           trailingC: hRatio(cH: 15),
                           centerVtoO: titleLbl.centerYAnchor)
        
        ui.universalLayout(object: areaRedoUndoVw,
                           parentView: self,
                           height: hRatio(cH:50),
                           leadingC: 0,
                           trailingC: 9,
                           topToO: purpleDescriptionLbl.bottomAnchor,
                           topCG: 0)
        
        ui.universalLayout(object: verticalLineVw,
                           parentView: areaRedoUndoVw,
                           width: 1,
                           height: 24,
                           centerH: 0,
                           topToO: purpleDescriptionLbl.bottomAnchor,
                           topCG: 12)
        
        ui.universalLayout(object: horizontalLineVw,
                           parentView: areaRedoUndoVw,
                           height: 1,
                           bottomC: 0,
                           leadingC: 0,
                           trailingC: 0)
        
        ui.universalLayout(object: undoRedoStackView,
                           parentView: areaRedoUndoVw,
                           height: hRatio(cH:50),
                           leadingC: 0,
                           trailingC: 0,
                           topToO: purpleDescriptionLbl.bottomAnchor,
                           topCG: 0)
        
        ui.universalLayout(object: barVw, parentView: self, height: 83, leadingC: 0, trailingC: 0)
        barVw.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        ui.universalLayout(object: barButtonStackView,
                           parentView: barVw,
                           height: 56,
                           bottomC: 0,
                           leadingC: 0,
                           trailingC: 0)
        
    }
}

// TO DO: Shadow under stack

extension UIButton {
  func alignImageAndTitleVertically(padding: CGFloat = 7.5) {
      
        let imageSize = imageView!.frame.size
        let titleSize = titleLabel!.frame.size
        let totalHeight = imageSize.height + titleSize.height + padding

        imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageSize.height),
            left: 0,
            bottom: 0,
            right: -titleSize.width
        )

        titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageSize.width,
            bottom: -(totalHeight - titleSize.height),
            right: 0
        )
    }
}

