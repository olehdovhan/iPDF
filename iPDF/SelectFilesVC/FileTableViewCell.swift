//
//  FileTableViewCell.swift
//  iPDF
//
//  Created by O l e h on 30.08.2022.
//

import UIKit

class FileTableViewCell:  BaseTableViewCell {
    
    static let id = "SelectFilesTVCell"
    
    var grayView = UIView()
    var selectFileBtn = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUI()
        layout()
    }
    
    
    private func setUI() {
        ui.setImgVw(imgVw: thumbnailImgVW,
                    view: self,
                    cntntMode: .scaleAspectFill)
        thumbnailImgVW.layer.cornerRadius = 3
        
        ui.shadow(object: thumbnailImgVW,
                  color: UIColor(red: 0.357, green: 0.408, blue: 0.443, alpha: 0.32),
                  radius: 2,
                  opacity: 1,
                  offset: CGSize(width: 0, height: 1))
        
        ui.setLabel(label: fileNameLbl,
                    view: self,
                    textColor: clr(color: .clrTitleMyFiles),
                    textAlignment: .left,
                    fontSize: wRatio(cW: 16),
                    fontWeight: .regular)
        
        ui.setLabel(label: dateLbl,
                    view: self,
                    textColor: clr(color: .clrGrayMyFiles),
                    textAlignment: .left,
                    fontSize: 13,
                    fontWeight: .regular)
        
        grayView.layer.backgroundColor = clr(color: .clrGrayMyFiles)?.cgColor
        
        ui.setLabel(label: sizeLbl,
                    view: self,
                    textColor: clr(color: .clrGrayMyFiles),
                    textAlignment: .left,
                    fontSize: 13,
                    fontWeight: .regular)
        
        ui.setButton(button: selectFileBtn,
                     view: contentView,
                     image: image(img: .emptyCheckMark),
                     controlState: .normal)
        
        selectFileBtn.setImage(image(img: .checkMark),
                               for: .selected)
    }

    
    private func layout() {
        
        ui.universalLayout(object: selectFileBtn,
                           parentView: self,
                           width: wRatio(cW:30),
                           height: wRatio(cW: 30),
                           leadingC: 0,
                           centerV: 0)
        
        ui.layout(imgVw: thumbnailImgVW,
                  view: self,
                  width: wRatio(cW: 45),
                  height: wRatio(cW: 60),
                  leadingC: wRatio(cW: 45),
                  centerV: 0)
        
        ui.lblLayout(label: fileNameLbl,
                     view: self,
                     height: 22,
                     topC: 25,
                     leadingToO: thumbnailImgVW.trailingAnchor,
                     leadingCG: wRatio(cW: 18))
        
        
        ui.lblLayout(label: dateLbl,
                     view: self,
                     height: 16,
                     topToO: fileNameLbl.bottomAnchor,
                     topCG: 6,
                     leadingToO: thumbnailImgVW.trailingAnchor,
                     leadingCG: wRatio(cW: 18))
        
        ui.layout(vw: grayView,
                  view: self,
                  width: 3,
                  height: 3,
                  centerVtoO: dateLbl.centerYAnchor,
                  leadingToO: dateLbl.trailingAnchor,
                  leadingCG: 7)
        
        grayView.layer.cornerRadius = grayView.height / 2
        grayView.layer.masksToBounds = true
        
        ui.lblLayout(label: sizeLbl,
                     view: self,
                     height: 16,
                     centerVtoO: grayView.centerYAnchor,
                     leadingToO: grayView.trailingAnchor,
                     leadingCG: 7)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

