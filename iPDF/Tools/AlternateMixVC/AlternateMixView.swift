//
//  AlternateMixView.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

class AlternateMixView: UIView {
    
    var backBtn = UIButton()
    var titleLbl = UILabel()
    var purpleDescriptionLbl = UILabel()
    var sortAzButton = UIButton()
    var sortZaButton = UIButton()
    var mixBtn = UIButton()
    var addFilesBtn = UIButton()
    var tableView = UITableView()
    
    override func draw(_ rect: CGRect) {
        sortAzButton.isSelected = true
        layer.backgroundColor = UIColor.white.cgColor
        setUI()
        layout()
        addTarget()
        stateSortButton()
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
                    labelText: "Alternate & Mix",
                    textColor: clr(color: .clrTitleMyFiles),
                    textAlignment: .center,
                    fontSize: 16,
                    fontWeight: .semibold)
        
        ui.setLabel(label: purpleDescriptionLbl,
                    view: self,
                    labelText: "Select files that you want to Alternate & Mix",
                    textColor: .white,
                    textAlignment: .center,
                    fontSize: 13,
                    fontWeight: .semibold,
                    backgroundColor: clr(color: .clrGreenTabTint))
        
        //button A-Z
        let configuration = UIImage.SymbolConfiguration(hierarchicalColor: clr(color: .clrGreenTabTint)!)
        
        let arrowDownImg = UIImage(systemName: "arrow.down",
                          withConfiguration: configuration)
     
        sortAzButton.imageEdgeInsets = UIEdgeInsets(top: -5,
                                                   left: -15,
                                                   bottom: -5,
                                                   right: 5)
        ui.setButton(button: sortAzButton,
                     view: self,
                     buttonText: "Sort A-Z",
                     cornerRadius: 10,
                     textColor: clr(color: .clrGreenTabTint),
                     fontSize: 16,
                     fontWeight: .semibold,
                     image: arrowDownImg,
                     controlState: .normal)
        
        sortAzButton.layer.masksToBounds = false
        //button Z-A
        let arrowUpImg = UIImage(systemName: "arrow.up",
                          withConfiguration: configuration)
     
        sortZaButton.imageEdgeInsets = sortZaButton.imageEdgeInsets
        ui.setButton(button: sortZaButton,
                     view: self,
                     buttonText: "Sort Z-A",
                     cornerRadius: 10,
                     textColor: clr(color: .clrGreenTabTint),
                     fontSize: 16,
                     fontWeight: .semibold,
                     image: arrowUpImg,
                     controlState: .normal)

        sortZaButton.layer.masksToBounds = false
        //----//
        let circleImg = UIImage(systemName: "plus.circle",
                          withConfiguration: configuration)
        
        addFilesBtn.imageEdgeInsets = UIEdgeInsets(top: -5,
                                                   left: -15,
                                                   bottom: -5,
                                                   right: 5)
        ui.setButton(button: addFilesBtn,
                     view: self,
                     buttonText: "Add Files",
                     backgroundColor: .white,
                     cornerRadius: 10,
                     textColor: clr(color: .clrGreenTabTint),
                     fontSize: 16,
                     fontWeight: .semibold,
                     image: circleImg,
                     controlState: .normal)
        addFilesBtn.layer.masksToBounds = false

        ui.shadow(object: addFilesBtn,
                  color: clr(color: .clrShadowButton),
                  radius: 2,
                  opacity: 1,
                  offset: CGSize(width: 0, height: 1))

        ui.setButton(button: mixBtn,
                     view: self,
                     buttonText: "Mix PDF Files",
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
        
        ui.universalLayout(object: sortAzButton,
                           parentView: self,
                           width: wRatio(cW: 172),
                           height: wRatio(cW: 50),
                           leadingC: hRatio(cH: 15),
                           topToO: purpleDescriptionLbl.bottomAnchor,
                           topCG: hRatio(cH: 17))
        
        ui.universalLayout(object: sortZaButton,
                           parentView: self,
                           width: wRatio(cW: 172),
                           height: wRatio(cW: 50),
                           trailingC: hRatio(cH: 15),
                           topToO: purpleDescriptionLbl.bottomAnchor,
                           topCG: hRatio(cH: 17))
        //--
        ui.universalLayout(object: addFilesBtn,
                           parentView: self,
                           width: wRatio(cW: 172),
                           height: wRatio(cW: 54),
                           bottomC: hRatio(cH: 29),
                           leadingC: hRatio(cH: 15))
        
        ui.universalLayout(object: mixBtn,
                           parentView: self,
                           width: wRatio(cW: 172),
                           height: wRatio(cW: 54),
                           bottomC: hRatio(cH: 29),
                           trailingC: hRatio(cH: 15))
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.isEditing = true
        
        ui.universalLayout(object: tableView,
                           parentView: self,
                           leadingC: wRatio(cW:15),
                           trailingC: wRatio(cW:15),
                           topToO: sortAzButton.bottomAnchor,
                           topCG: 17,
                           bottomToO: mixBtn.topAnchor,
                           bottomCG: 10)
    }
    func stateSortButton() {
        switch sortAzButton.isSelected {
            
        case true:
            sortAzButton.backgroundColor = clr(color: .clrButtonSelected)
            ui.shadow(object: sortAzButton,
                      color: .clear,
                      radius: 0,
                      opacity: 0,
                      offset: .zero)

            sortZaButton.backgroundColor = .white
            ui.shadow(object: sortZaButton,
                      color: clr(color: .clrShadowButton),
                      radius: 2,
                      opacity: 1,
                      offset: CGSize(width: 0, height: 1))
         
        case false:
            
            sortAzButton.backgroundColor = .white
            ui.shadow(object: sortAzButton,
                      color: clr(color: .clrShadowButton),
                      radius: 2,
                      opacity: 1,
                      offset: CGSize(width: 0, height: 1))
            
            sortZaButton.backgroundColor = clr(color: .clrButtonSelected)
            ui.shadow(object: sortZaButton,
                      color: .clear,
                      radius: 0,
                      opacity: 0,
                      offset: .zero)
        }
    }
    
    func addTarget(){
        sortAzButton.addTarget(self, action: #selector(pressedSortAz), for: .touchUpInside)
        sortZaButton.addTarget(self, action: #selector(pressedSortAz), for: .touchUpInside)
    }
    
    @objc func pressedSortAz() {
        sortAzButton.isSelected.toggle()
        sortZaButton.isSelected = !sortAzButton.isSelected
        stateSortButton()
    }
}
