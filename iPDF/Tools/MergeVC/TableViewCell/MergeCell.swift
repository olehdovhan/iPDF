//
//  MergeCell.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

class MergeCell: BaseTableViewCell {
    
    static let id = "MergeCell"
    
    let whiteVw = UIView()
    var grayView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUI()
        layout()
    }
    
    private func setUI(){
        
        whiteVw.layer.backgroundColor = UIColor.white.cgColor
        whiteVw.layer.cornerRadius = 10
        ui.shadow(object: whiteVw,
                  color: clr(color: .clrShadowSection),
                  radius: 2,
                  opacity: 1,
                  offset: CGSize(width: 0, height: 1))
        
        ui.setImgVw(imgVw: thumbnailImgVW,
                     view: whiteVw,
                     cntntMode: .scaleAspectFill)
        
        thumbnailImgVW.layer.cornerRadius = 3
        
        ui.shadow(object: thumbnailImgVW,
                  color: UIColor(red: 0.357, green: 0.408, blue: 0.443, alpha: 0.32),
                  radius: 2,
                  opacity: 1,
                  offset: CGSize(width: 0, height: 1))

        ui.setLabel(label: fileNameLbl,
                    view: whiteVw,
                    textColor: clr(color: .clrTitleMyFiles),
                    textAlignment: .left,
                    fontSize: wRatio(cW: 16),
                    fontWeight: .regular)
        fileNameLbl.minimumScaleFactor = 0.66
        
        ui.setLabel(label: dateLbl,
                    view: whiteVw,
                    textColor: clr(color: .clrGrayMyFiles),
                    textAlignment: .left,
                    fontSize: 13,
                    fontWeight: .regular)
        
        grayView.layer.backgroundColor = clr(color: .clrGrayMyFiles)?.cgColor

        ui.setLabel(label: sizeLbl,
                    view: whiteVw,
                    labelText: "71 KB",
                    textColor: clr(color: .clrGrayMyFiles),
                    textAlignment: .left,
                    fontSize: 13,
                    fontWeight: .regular)
    }
    
    private func layout() {
        
        ui.universalLayout(object: whiteVw,
                           parentView: self,
                           topC: 5,
                           bottomC: 5,
                           leadingC: 5,
                           trailingC: 5,
                           centerV: 0,
                           centerH: 0)
        
        ui.universalLayout(object: thumbnailImgVW,
                           parentView: whiteVw,
                           width: wRatio(cW: 45),
                           height: wRatio(cW: 60),
                           topC: 12,
                           leadingC: wRatio(cW: 12))
        
        ui.universalLayout(object: fileNameLbl,
                           parentView: whiteVw,
                           width: wRatio(cW:215),
                           height: 22,
                           topC: 20,
                           leadingToO: thumbnailImgVW.trailingAnchor,
                           leadingCG: 15)
        
        ui.lblLayout(label: dateLbl,
                     view: self,
                     height: 16,
                     topToO: fileNameLbl.bottomAnchor,
                     topCG: 6,
                     leadingToO: thumbnailImgVW.trailingAnchor,
                     leadingCG: wRatio(cW: 15))
        
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
