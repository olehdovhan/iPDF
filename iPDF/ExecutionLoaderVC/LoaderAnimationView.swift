//
//  LoaderAnimationView.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

protocol LoaderProtocol {
    
    var backClr: UIColor { get set }
    var animClr: UIColor { get set }
    var diametr: CGFloat { get set }
    var lineWidth: CGFloat { get set }
    
    func animatingSelf()
    func setLayersPaths()
    
}

class LoaderAnimationView: UIView, LoaderProtocol {
  
    var backClr: UIColor
    var animClr: UIColor
    var diametr: CGFloat
    var lineWidth: CGFloat

    private var shapeLayer = CAShapeLayer()
    private var animateShapeLayer = CAShapeLayer()
    
    private  let startAngle: CGFloat = ( -.pi / 2 )
    private  let endAngle: CGFloat = (3 * .pi / 2 )
    
    func animatingSelf() {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 0.75
        animation.autoreverses = true
        animation.duration = 2
        animation.repeatCount = 100
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = 3
        rotateAnimation.repeatCount=Float.infinity
        layer.add(rotateAnimation, forKey: nil)
        animateShapeLayer.add(animation, forKey: nil)
    }
    
    func setLayersPaths() {
        
        let cgPath = UIBezierPath(arcCenter: CGPoint(x: 0,
                                                     y: 0),
                                  radius: diametr / 2,
                                  startAngle: startAngle,
                                  endAngle: endAngle,
                                  clockwise: true).cgPath
        
        animateShapeLayer.path = cgPath
        animateShapeLayer.lineWidth = lineWidth
        animateShapeLayer.lineCap = .round
        animateShapeLayer.strokeColor = animClr.cgColor
        animateShapeLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.path = cgPath
        shapeLayer.lineWidth = lineWidth
        shapeLayer.strokeColor = backClr.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.addSublayer(animateShapeLayer)
        self.layer.addSublayer(shapeLayer)
        shapeLayer.position = CGPoint(x: self.layer.bounds.midX,
                                      y: self.layer.bounds.midY)
    }
    
    init(animClr: UIColor, backClr: UIColor, diametr: CGFloat, lineWidth: CGFloat) {
        self.animClr = animClr
        self.backClr = backClr
        self.diametr = diametr
        self.lineWidth = lineWidth
        super.init(frame: .zero)
        self.setLayersPaths()
        self.animatingSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
