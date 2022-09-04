//
//  DocumentTVCell.swift
//  iPDF
//
//  Created by O l e h on 26.08.2022.
//

import UIKit

class DocumentTVCell: BaseTableViewCell {

    static let id = "DocumentTVCell"
   
    var grayView = UIView()
    var threeDotsBtn = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUI()
        layout()
    }

    func setUI() {
         
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
                    fontSize: 16,
                    fontName: "Montserrat-Medium")
        
        // наполняй дату из документа
        ui.setLabel(label: dateLbl,
                    view: self,
                    textColor: clr(color: .clrGrayMyFiles),
                    textAlignment: .left,
                    fontSize: 13,
                    fontName: "Montserrat-Medium")
        
        grayView.layer.backgroundColor = clr(color: .clrGrayMyFiles)?.cgColor

        ui.setLabel(label: sizeLbl,
                    view: self,
                    textColor: clr(color: .clrGrayMyFiles),
                    textAlignment: .left,
                    fontSize: 13,
                    fontName: "Montserrat-Medium")
        
        ui.setButton(button: threeDotsBtn,
                     view: contentView,
                     image: image(img: .threeVerticalDots),
                     controlState: .normal)
    }
    
    func layout() {
    
        ui.layout(imgVw: thumbnailImgVW,
                  view: self,
                  width: 45,
                  height: 60,
                  leadingC: 0,
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
        
        ui.btnLayout(button: threeDotsBtn,
                     view: self,
                     width: 24,
                     height: 24,
                     trailingC: 0,
                     centerV: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
