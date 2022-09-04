//
//  ExecutionLoaderVw.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

class ExecutionLoaderVw: UIView {
    
    var logoImgVw = UIImageView()
    var descriptionLbl = UILabel()
    let label = UILabel()
    var loaderView: LoaderAnimationView!
    
    override func draw(_ rect: CGRect) {
        
        layer.backgroundColor = UIColor.white.cgColor
        
        loaderView = LoaderAnimationView(animClr: clr(color: .clrGreenTabTint)!,
                                         backClr: clr(color: .clrBackAnimateBlue)!,
                                         diametr: 100,
                                         lineWidth: 10)
    
        ui.setImgVw(imgVw: logoImgVw,
                    view: self,
                    image: image(img: .mainLogo),
                    cntntMode: .scaleAspectFill)
        
        
        ui.setLabel(label: descriptionLbl,
                    view: self,
                    textColor: clr(color: .clrTitleMyFiles),
                    textAlignment: .center,
                    fontSize: 16,
                    fontWeight: .semibold)
        
        ui.universalLayout(object: logoImgVw,
                           parentView: self,
                           width: wRatio(cW: 111),
                           height: wRatio(cW: 36),
                           topC: hRatio(cH: 140),
                           centerH: 0)
        
        ui.universalLayout(object: loaderView,
                           parentView: self,
                           topC: hRatio(cH: 390),
                           centerH: 0)
    
        ui.universalLayout(object: descriptionLbl,
                           parentView: self,
                           centerH: 0,
                           topToO: loaderView.bottomAnchor,
                           topCG: hRatio(cH: 100))
    }
}
