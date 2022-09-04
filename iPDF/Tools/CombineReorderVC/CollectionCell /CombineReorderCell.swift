//
//  CombineReorderCell.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit
import PDFKit

class CombineReorderCell: UICollectionViewCell {
    
    static let id = "CombineReorderCell"
    
    let whiteVw = UIView()
    var thumbnailImgVW = UIImageView()
    var substrateVw = UIView()
    var selectFileBtn = UIButton()
    var numberLbl = UILabel()
    var document: PDFPage!
    var url11: URL!
    var number: Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        layout()
    }
    
    override func prepareForReuse() {
        selectFileBtn.isSelected = false
        thumbnailImgVW.image = nil
        numberLbl.text = nil
        fillCellBy(document: document,
                   url: url11,
                   number: number)
    }
    
    func fillCellBy(document: PDFPage, url: URL, number: Int) {
        selectFileBtn.isSelected = false
        thumbnailImgVW.image = nil
        numberLbl.text = nil
        self.document = document
        numberLbl.text = String(number)
        let image = thumbnailFromPdf(withUrl: url,
                                     pageNumber: number,
                                     width: wRatio(cW: 239))
        thumbnailImgVW.image = image
    }
    
    
    private func setUI() {
        ui.setImgVw(imgVw: thumbnailImgVW,
                    view: self,
                    cntntMode: .scaleAspectFill)
        
        thumbnailImgVW.layer.cornerRadius = 3
        ui.shadow(object: thumbnailImgVW,
                  color: clr(color: .clrShadowSection),
                  radius: 2,
                  opacity: 1,
                  offset: CGSize(width: 0, height: 1))
        
        substrateVw.layer.cornerRadius = thumbnailImgVW.layer.cornerRadius
        
        ui.setButton(button: selectFileBtn,
                     view: substrateVw,
                     image: image(img: .checkMarkFill),
                     controlState: .normal)
        
        selectFileBtn.setImage(image(img: .checkMark),
                               for: .selected)
        
        ui.setLabel(label: numberLbl,
                    view: substrateVw,
                    textColor: .white,
                    textAlignment: .center,
                    fontSize: wRatio(cW: 12),
                    fontWeight: .bold,
                    backgroundColor: clr(color: .clrNumberArea),
                    cornerRadius: 5)
    }
    
    private func layout() {
        
        ui.universalLayout(object: thumbnailImgVW,
                           parentView: self,
                           topC: 0,
                           bottomC: 0,
                           leadingC: 0,
                           trailingC: 0)
        
        ui.universalLayout(object: substrateVw,
                           parentView: self,
                           topToO: thumbnailImgVW.topAnchor,
                           topCG: 0,
                           bottomToO: thumbnailImgVW.bottomAnchor,
                           bottomCG: 0,
                           leadingToO: thumbnailImgVW.leadingAnchor,
                           leadingCG: 0,
                           trailingToO: thumbnailImgVW.trailingAnchor,
                           trailingCG: 0)
        
        ui.universalLayout(object: selectFileBtn,
                           parentView: substrateVw,
                           width: 30,
                           height: 30,
                           topC: 18,
                           leadingC: 18)
        
        ui.universalLayout(object: numberLbl,
                           parentView: thumbnailImgVW,
                           width: wRatio(cW: 36),
                           height: hRatio(cH: 24),
                           bottomC: 24,
                           centerHtoO: thumbnailImgVW.centerXAnchor)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
