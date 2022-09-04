//
//  AlternateCell.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit
import PDFKit

class AlternateCell: UITableViewCell {
    
    static let id = "---"
    
    let whiteVw = UIView()
    let verticalLineVw = UIView()
    let horizontalUpLineVw = UIView()
    let horizontalDownLineVw = UIView()
    let sliderBtn = UIButton()
    var fileNameLbl = UILabel()
    
    var thumbnailImgVW = UIImageView()
    
    var trashBtn = UIButton()
    var settingsBtn = UIButton()
    
    var totalPagesLbl = UILabel()
    var switchDocumentLbl = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setUI()
        layout()
    }
    
    private func setUI() {
        whiteVw.layer.backgroundColor = UIColor.white.cgColor
        whiteVw.layer.cornerRadius = 10
        ui.shadow(object: whiteVw,
                  color: clr(color: .clrShadowSection),
                  radius: 2,
                  opacity: 1,
                  offset: CGSize(width: 0, height: 1))
        
        verticalLineVw.backgroundColor = clr(color: .clrLineGray)
        horizontalUpLineVw.backgroundColor = clr(color: .clrLineGray)
        horizontalDownLineVw.backgroundColor = clr(color: .clrLineGray)
        
        //-- file
        ui.setImgVw(imgVw: thumbnailImgVW,
                    view: whiteVw,
                    image: image(img: .dummyDocument),
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
                    fontSize: 16,
                    fontWeight: .regular)
        
        ui.setLabel(label: totalPagesLbl,
                    view: whiteVw,
                    textColor: clr(color: .clrTextGray),
                    textAlignment: .left,
                    fontSize: wRatio(cW: 13),
                    fontWeight: .regular)
        
        ui.setLabel(label: switchDocumentLbl,
                    view: whiteVw,
                    labelText: "Switch document after reading 1 pages",
                    textColor: clr(color: .clrTextGray),
                    textAlignment: .left,
                    fontSize: wRatio(cW: 13),
                    fontWeight: .regular)
        
        ui.setButton(button: trashBtn,
                     view: whiteVw,
                     image: image(img: .trashBtn),
                     controlState: .normal)
    }
    
    func fillCellBy(document: MODocument) {
        fileNameLbl.text = document.fileName
        guard let url = URL(string: document.fileURL!),
        let doc = PDFDocument(url: url) else { return }
        totalPagesLbl.text = "Total pages: \(doc.pageCount)| Regular Order"
        let image = thumbnailFromPdf(withUrl: url,
                                     pageNumber: 1,
                                     width: 34)
        self.thumbnailImgVW.image = image
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
        
        ui.universalLayout(object: verticalLineVw,
                           parentView: whiteVw,
                           width: 0.5,
                           topToO: whiteVw.topAnchor,
                           topCG: 0,
                           bottomToO: whiteVw.bottomAnchor,
                           bottomCG: 0,
                           trailingToO: whiteVw.trailingAnchor,
                           trailingCG: wRatio(cW: 54))
        
        ui.universalLayout(object: horizontalUpLineVw,
                           parentView: whiteVw,
                           height: 0.5,
                           topToO: whiteVw.topAnchor,
                           topCG: 58,
                           leadingToO: whiteVw.leadingAnchor,
                           leadingCG: 12,
                           trailingToO: verticalLineVw.centerXAnchor,
                           trailingCG: 12)
        
        ui.universalLayout(object: horizontalDownLineVw,
                           parentView: whiteVw,
                           height: 0.5,
                           topToO: whiteVw.topAnchor,
                           topCG: 124,
                           leadingToO: whiteVw.leadingAnchor,
                           leadingCG: 12,
                           trailingToO: verticalLineVw.centerXAnchor,
                           trailingCG: 12)
        
        //-- file:
        ui.universalLayout(object: thumbnailImgVW,
                           parentView: whiteVw,
                           width: 25, height: 34,
                           topC: 12,
                           leadingC: 12)
        
        ui.universalLayout(object: fileNameLbl,
                           parentView: whiteVw,
                           width: wRatio(cW:240),
                           height: 22,
                           centerVtoO: thumbnailImgVW.centerYAnchor,
                           leadingToO: thumbnailImgVW.trailingAnchor,
                           leadingCG: 12)
        
        ui.btnLayout(button: trashBtn,
                     view: whiteVw,
                     width: wRatio(cW: 54),
                     height: wRatio(cW: 54),
                     bottomC: 12,
                     leadingC: 12)
        
        ui.setButton(button: settingsBtn,
                     view: contentView,
                     image: image(img: .settingsBtn),
                     controlState: .normal)
        
        ui.btnLayout(button: settingsBtn,
                     view: whiteVw,
                     width: wRatio(cW: 216),
                     height: wRatio(cW: 54),
                     leadingC: wRatio(cW: 78),
                     bottomToO: whiteVw.bottomAnchor,
                     bottomCG: 12,
                     trailingToO: verticalLineVw.leadingAnchor,
                     trailingCG: 12)
        
        trashBtn.addTarget(self,
                           action: #selector(trash),
                           for: .touchUpInside)
        
        ui.universalLayout(object: totalPagesLbl,
                           parentView: whiteVw,
                           width: wRatio(cW: 282),
                           height: 16,
                           leadingC: 12,
                           topToO: horizontalUpLineVw.bottomAnchor,
                           topCG: 12)
        
        ui.universalLayout(object: switchDocumentLbl,
                           parentView: whiteVw,
                           width: wRatio(cW: 282),
                           height: 16,
                           leadingC: 12,
                           topToO: totalPagesLbl.bottomAnchor,
                           topCG: 5)
        
    }
    
    @objc func trash()  {
        print("check")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
