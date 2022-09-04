//
//  SetUIManager.swift
//  iPDF
//
//  Created by O l e h on 26.08.2022.
//

import UIKit

struct SetUIManager {
    
    func set(progress: UIProgressView,
             view: UIView,
             result: Float? = nil,
             progClr: UIColor? = nil,
             backClr: UIColor? = nil,
             cornerRadius: CGFloat? = nil) {
        
        
        if result != nil {
            progress.setProgress(result!, animated: true)
        }
        
        if progClr != nil, backClr != nil {
            progress.trackTintColor = backClr
            progress.progressTintColor = progClr
        }
        
        if cornerRadius != nil {
            progress.layer.cornerRadius = cornerRadius!
            progress.layer.masksToBounds = true
        }
    }
    
    func setLabel(label: UILabel,
                  view: UIView,
                  labelText: String? = nil,
                  textColor: UIColor? = nil,
                  textAlignment: NSTextAlignment? = nil,
                  fontSize: CGFloat? = nil,
                  fontWeight: UIFont.Weight? = nil,
                  fontName: String? = nil,
                  backgroundColor: UIColor? = nil,
                  cornerRadius: CGFloat? = nil,
                  lines: Int? = nil)
    {
        
        if backgroundColor != nil {
            label.backgroundColor = backgroundColor!
        }
        if labelText != nil {
            label.text = labelText!
        }
        if cornerRadius != nil {
            label.layer.cornerRadius = cornerRadius!
            label.layer.masksToBounds = true
        }
        if textColor != nil {
            label.textColor = textColor!
        }
        if textAlignment != nil {
            label.textAlignment = textAlignment!
        }
        if fontName != nil, fontSize != nil {
            label.font = UIFont(name: fontName!, size: fontSize!)
        }
        if fontSize != nil, fontWeight != nil {
            label.font = UIFont.systemFont(ofSize: fontSize!, weight: fontWeight!)
        }
        if lines != nil {
            label.numberOfLines = lines!
        }
    }
    
    func setButton(button: UIButton,
                   view: UIView,
                   buttonText: String? = nil,
                   backgroundColor: UIColor? = nil,
                   cornerRadius: CGFloat? = nil,
                   textColor: UIColor? = nil,
                   fontName: String? = nil,
                   fontSize: CGFloat? = nil,
                   fontWeight: UIFont.Weight? = nil,
                   image: UIImage? = nil,
                   controlState: UIControl.State? = nil) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        if backgroundColor != nil {
            button.backgroundColor = backgroundColor!
        }
        if cornerRadius != nil {
            button.layer.cornerRadius = cornerRadius!
            button.layer.masksToBounds = true
        }
        if fontName != nil, fontSize != nil {
            button.titleLabel?.font = UIFont(name: fontName!, size: fontSize!)
        }
        if fontSize != nil, fontWeight != nil {
            button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize!, weight: fontWeight!)
        }
        guard controlState != nil else { return }
        if buttonText != nil {
            button.setTitle(buttonText!, for: controlState!)
        }
        if textColor != nil {
            button.setTitleColor(textColor!, for: controlState!)
        }
        if image != nil {
            button.setImage(image!, for: controlState!)
        }
    }
    
    func setImgVw(imgVw: UIImageView,
                  view: UIView,
                  image: UIImage? = nil,
                  cntntMode: UIView.ContentMode? = nil
    )
    {
        imgVw.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imgVw)
        
        if image != nil {
            imgVw.image = image!
        }
        if cntntMode != nil {
            imgVw.contentMode = cntntMode!
        }
    }
    
    func lblLayout(label: UILabel,
                   view: UIView,
                   width: CGFloat? = nil,
                   height: CGFloat? = nil,
                   topC: CGFloat? = nil,
                   bottomC: CGFloat? = nil,
                   leadingC: CGFloat? = nil,
                   trailingC: CGFloat? = nil,
                   centerV: CGFloat? = nil,
                   centerH: CGFloat? = nil,
                   centerVtoO: Any? = nil,
                   centerHtoO: Any? = nil,
                   topToO: Any? = nil,
                   topCG: CGFloat? = nil,
                   bottomToO: Any? = nil,
                   bottomCG: CGFloat? = nil,
                   leadingToO: Any? = nil,
                   leadingCG: CGFloat? = nil,
                   trailingToO: Any? = nil,
                   trailingCG: CGFloat? = nil
    ) {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        if width != nil {
            label.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            label.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            label.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            label.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            label.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            label.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            label.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            label.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    func btnLayout(button: UIButton,
                   view: UIView,
                   width: CGFloat? = nil,
                   height: CGFloat? = nil,
                   topC: CGFloat? = nil,
                   bottomC: CGFloat? = nil,
                   leadingC: CGFloat? = nil,
                   trailingC: CGFloat? = nil,
                   centerV: CGFloat? = nil,
                   centerH: CGFloat? = nil,
                   centerVtoO: Any? = nil,
                   centerHtoO: Any? = nil,
                   topToO: Any? = nil,
                   topCG: CGFloat? = nil,
                   bottomToO: Any? = nil,
                   bottomCG: CGFloat? = nil,
                   leadingToO: Any? = nil,
                   leadingCG: CGFloat? = nil,
                   trailingToO: Any? = nil,
                   trailingCG: CGFloat? = nil
    ) {
        if width != nil {
            button.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            button.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            button.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            button.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            button.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            button.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            button.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            button.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    func layout(imgVw: UIImageView,
                view: UIView,
                width: CGFloat? = nil,
                height: CGFloat? = nil,
                topC: CGFloat? = nil,
                bottomC: CGFloat? = nil,
                leadingC: CGFloat? = nil,
                trailingC: CGFloat? = nil,
                centerV: CGFloat? = nil,
                centerH: CGFloat? = nil,
                centerVtoO: Any? = nil,
                centerHtoO: Any? = nil,
                topToO: Any? = nil,
                topCG: CGFloat? = nil,
                bottomToO: Any? = nil,
                bottomCG: CGFloat? = nil,
                leadingToO: Any? = nil,
                leadingCG: CGFloat? = nil,
                trailingToO: Any? = nil,
                trailingCG: CGFloat? = nil
    ) {
        
        if width != nil {
            imgVw.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            imgVw.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            imgVw.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            imgVw.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            imgVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            imgVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            imgVw.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            imgVw.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            imgVw.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            imgVw.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            imgVw.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            imgVw.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            imgVw.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            imgVw.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    func layout(tableView: UITableView,
                view: UIView,
                topC: CGFloat? = nil,
                bottomC: CGFloat? = nil,
                leadingC: CGFloat? = nil,
                trailingC: CGFloat? = nil,
                topToO: Any? = nil,
                topCG: CGFloat? = nil
    )
    {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        if topC != nil {
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        
        if bottomC != nil {
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if topToO != nil, topCG != nil {
            tableView.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
    }
    
    func layout(collectionView: UICollectionView,
                view: UIView,
                width: CGFloat? = nil,
                height: CGFloat? = nil,
                topC: CGFloat? = nil,
                bottomC: CGFloat? = nil,
                leadingC: CGFloat? = nil,
                trailingC: CGFloat? = nil,
                topToO: Any? = nil,
                topCG: CGFloat? = nil,
                centerH: CGFloat? = nil,
                centerV: CGFloat? = nil
    )
    {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        if width != nil {
            collectionView.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            collectionView.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -bottomC!).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if topToO != nil, topCG != nil {
            collectionView.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if centerH != nil {
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        
        if centerV != nil {
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
    }
    
    func layout(vw: UIView,
                view: UIView,
                width: CGFloat? = nil,
                height: CGFloat? = nil,
                topC: CGFloat? = nil,
                bottomC: CGFloat? = nil,
                leadingC: CGFloat? = nil,
                trailingC: CGFloat? = nil,
                centerV: CGFloat? = nil,
                centerH: CGFloat? = nil,
                centerVtoO: Any? = nil,
                centerHtoO: Any? = nil,
                topToO: Any? = nil,
                topCG: CGFloat? = nil,
                bottomToO: Any? = nil,
                bottomCG: CGFloat? = nil,
                leadingToO: Any? = nil,
                leadingCG: CGFloat? = nil,
                trailingToO: Any? = nil,
                trailingCG: CGFloat? = nil
    )
    {
        vw.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vw)
        if topC != nil {
            vw.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            vw.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            vw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            vw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if width != nil {
            vw.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            vw.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if centerV != nil {
            vw.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            vw.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            vw.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            vw.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            vw.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            vw.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            vw.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            vw.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    func layout(textField: UITextField,
                view: UIView,
                width: CGFloat? = nil,
                height: CGFloat? = nil,
                topC: CGFloat? = nil,
                bottomC: CGFloat? = nil,
                leadingC: CGFloat? = nil,
                trailingC: CGFloat? = nil,
                centerV: CGFloat? = nil,
                centerH: CGFloat? = nil,
                centerVtoO: Any? = nil,
                centerHtoO: Any? = nil,
                topToO: Any? = nil,
                topCG: CGFloat? = nil,
                bottomToO: Any? = nil,
                bottomCG: CGFloat? = nil,
                leadingToO: Any? = nil,
                leadingCG: CGFloat? = nil,
                trailingToO: Any? = nil,
                trailingCG: CGFloat? = nil
    ) {
        
        if width != nil {
            textField.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            textField.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            textField.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            textField.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            textField.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            textField.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            textField.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            textField.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    func sliderLayout(slider: UISlider,
                      view: UIView,
                      width: CGFloat? = nil,
                      height: CGFloat? = nil,
                      topC: CGFloat? = nil,
                      bottomC: CGFloat? = nil,
                      leadingC: CGFloat? = nil,
                      trailingC: CGFloat? = nil,
                      centerV: CGFloat? = nil,
                      centerH: CGFloat? = nil,
                      centerVtoO: Any? = nil,
                      centerHtoO: Any? = nil,
                      topToO: Any? = nil,
                      topCG: CGFloat? = nil,
                      bottomToO: Any? = nil,
                      bottomCG: CGFloat? = nil,
                      leadingToO: Any? = nil,
                      leadingCG: CGFloat? = nil,
                      trailingToO: Any? = nil,
                      trailingCG: CGFloat? = nil
    ) {
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        
        if width != nil {
            slider.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            slider.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            slider.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            slider.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            slider.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            slider.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            slider.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            slider.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            slider.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }

    
    func pickerViewLayout(pickerView: UIPickerView,
                          view: UIView,
                          width: CGFloat? = nil,
                          height: CGFloat? = nil,
                          topC: CGFloat? = nil,
                          bottomC: CGFloat? = nil,
                          leadingC: CGFloat? = nil,
                          trailingC: CGFloat? = nil,
                          centerV: CGFloat? = nil,
                          centerH: CGFloat? = nil,
                          centerVtoO: Any? = nil,
                          centerHtoO: Any? = nil,
                          topToO: Any? = nil,
                          topCG: CGFloat? = nil,
                          bottomToO: Any? = nil,
                          bottomCG: CGFloat? = nil,
                          leadingToO: Any? = nil,
                          leadingCG: CGFloat? = nil,
                          trailingToO: Any? = nil,
                          trailingCG: CGFloat? = nil
    ) {
        pickerView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(pickerView)
        
        if width != nil {
            pickerView.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            pickerView.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            pickerView.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            pickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            pickerView.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            pickerView.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            pickerView.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            pickerView.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            pickerView.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            pickerView.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    func searchBarLayout(searchBar: UISearchBar,
                         view: UIView,
                         width: CGFloat? = nil,
                         height: CGFloat? = nil,
                         topC: CGFloat? = nil,
                         bottomC: CGFloat? = nil,
                         leadingC: CGFloat? = nil,
                         trailingC: CGFloat? = nil,
                         centerV: CGFloat? = nil,
                         centerH: CGFloat? = nil,
                         centerVtoO: Any? = nil,
                         centerHtoO: Any? = nil,
                         topToO: Any? = nil,
                         topCG: CGFloat? = nil,
                         bottomToO: Any? = nil,
                         bottomCG: CGFloat? = nil,
                         leadingToO: Any? = nil,
                         leadingCG: CGFloat? = nil,
                         trailingToO: Any? = nil,
                         trailingCG: CGFloat? = nil
    ) {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        if width != nil {
            searchBar.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            searchBar.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            searchBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            searchBar.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            searchBar.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            searchBar.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            searchBar.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            searchBar.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            searchBar.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            searchBar.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    
    
    func sgmntdCtrlLayout(segmentedControl: UISegmentedControl,
                          view: UIView,
                          width: CGFloat? = nil,
                          height: CGFloat? = nil,
                          topC: CGFloat? = nil,
                          bottomC: CGFloat? = nil,
                          leadingC: CGFloat? = nil,
                          trailingC: CGFloat? = nil,
                          centerV: CGFloat? = nil,
                          centerH: CGFloat? = nil,
                          centerVtoO: Any? = nil,
                          centerHtoO: Any? = nil,
                          topToO: Any? = nil,
                          topCG: CGFloat? = nil,
                          bottomToO: Any? = nil,
                          bottomCG: CGFloat? = nil,
                          leadingToO: Any? = nil,
                          leadingCG: CGFloat? = nil,
                          trailingToO: Any? = nil,
                          trailingCG: CGFloat? = nil
    ) {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        if width != nil {
            segmentedControl.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            segmentedControl.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            segmentedControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            segmentedControl.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            segmentedControl.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            segmentedControl.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            segmentedControl.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            segmentedControl.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            segmentedControl.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    
    
    
    func switchlLayout(switchObject: UISwitch,
                       view: UIView,
                       width: CGFloat? = nil,
                       height: CGFloat? = nil,
                       topC: CGFloat? = nil,
                       bottomC: CGFloat? = nil,
                       leadingC: CGFloat? = nil,
                       trailingC: CGFloat? = nil,
                       centerV: CGFloat? = nil,
                       centerH: CGFloat? = nil,
                       centerVtoO: Any? = nil,
                       centerHtoO: Any? = nil,
                       topToO: Any? = nil,
                       topCG: CGFloat? = nil,
                       bottomToO: Any? = nil,
                       bottomCG: CGFloat? = nil,
                       leadingToO: Any? = nil,
                       leadingCG: CGFloat? = nil,
                       trailingToO: Any? = nil,
                       trailingCG: CGFloat? = nil
    ) {
        switchObject.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(switchObject)
        
        if width != nil {
            switchObject.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            switchObject.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            switchObject.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            switchObject.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            switchObject.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            switchObject.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            switchObject.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            switchObject.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            switchObject.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            switchObject.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            switchObject.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            switchObject.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            switchObject.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            switchObject.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    
    func progresslLayout(progress: UIProgressView,
                         view: UIView,
                         width: CGFloat? = nil,
                         height: CGFloat? = nil,
                         topC: CGFloat? = nil,
                         bottomC: CGFloat? = nil,
                         leadingC: CGFloat? = nil,
                         trailingC: CGFloat? = nil,
                         centerV: CGFloat? = nil,
                         centerH: CGFloat? = nil,
                         centerVtoO: Any? = nil,
                         centerHtoO: Any? = nil,
                         topToO: Any? = nil,
                         topCG: CGFloat? = nil,
                         bottomToO: Any? = nil,
                         bottomCG: CGFloat? = nil,
                         leadingToO: Any? = nil,
                         leadingCG: CGFloat? = nil,
                         trailingToO: Any? = nil,
                         trailingCG: CGFloat? = nil
    ) {
        progress.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progress)
        
        if width != nil {
            progress.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            progress.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            progress.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            progress.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            progress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            progress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            progress.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            progress.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            progress.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            progress.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            progress.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            progress.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            progress.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            progress.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    
    func pcLayout(pc: UIPageControl,
                  view: UIView,
                  width: CGFloat? = nil,
                  height: CGFloat? = nil,
                  topC: CGFloat? = nil,
                  bottomC: CGFloat? = nil,
                  leadingC: CGFloat? = nil,
                  trailingC: CGFloat? = nil,
                  centerV: CGFloat? = nil,
                  centerH: CGFloat? = nil,
                  centerVtoO: Any? = nil,
                  centerHtoO: Any? = nil,
                  topToO: Any? = nil,
                  topCG: CGFloat? = nil,
                  bottomToO: Any? = nil,
                  bottomCG: CGFloat? = nil,
                  leadingToO: Any? = nil,
                  leadingCG: CGFloat? = nil,
                  trailingToO: Any? = nil,
                  trailingCG: CGFloat? = nil
    ) {
        pc.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pc)
        
        if width != nil {
            pc.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            pc.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            pc.topAnchor.constraint(equalTo: view.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            pc.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            pc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            pc.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            pc.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            pc.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            pc.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            pc.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            pc.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            pc.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            pc.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            pc.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    func textViewLayout(textView: UITextView,
                       view: UIView,
                       width: CGFloat? = nil,
                       height: CGFloat? = nil,
                       topC: CGFloat? = nil,
                       bottomC: CGFloat? = nil,
                       leadingC: CGFloat? = nil,
                       trailingC: CGFloat? = nil,
                       centerV: CGFloat? = nil,
                       centerH: CGFloat? = nil,
                       centerVtoO: Any? = nil,
                       centerHtoO: Any? = nil,
                       topToO: Any? = nil,
                       topCG: CGFloat? = nil,
                       bottomToO: Any? = nil,
                       bottomCG: CGFloat? = nil,
                       leadingToO: Any? = nil,
                       leadingCG: CGFloat? = nil,
                       trailingToO: Any? = nil,
                       trailingCG: CGFloat? = nil
    ) {
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        
        if width != nil {
            textView.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            textView.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            textView.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            textView.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            textView.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        
        if bottomToO != nil, bottomCG != nil {
            textView.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        
        if leadingToO != nil, leadingCG != nil {
            textView.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        
        if trailingToO != nil, trailingCG != nil {
            textView.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    func universalLayout<T: UIView>(object: T ,
                                    parentView: UIView,
                                    width: CGFloat? = nil,
                                    height: CGFloat? = nil,
                                    topC: CGFloat? = nil,
                                    bottomC: CGFloat? = nil,
                                    leadingC: CGFloat? = nil,
                                    trailingC: CGFloat? = nil,
                                    centerV: CGFloat? = nil,
                                    centerH: CGFloat? = nil,
                                    centerVtoO: Any? = nil,
                                    centerHtoO: Any? = nil,
                                    topToO: Any? = nil,
                                    topCG: CGFloat? = nil,
                                    bottomToO: Any? = nil,
                                    bottomCG: CGFloat? = nil,
                                    leadingToO: Any? = nil,
                                    leadingCG: CGFloat? = nil,
                                    trailingToO: Any? = nil,
                                    trailingCG: CGFloat? = nil)
    {
        object.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(object)
        
        if width != nil {
            object.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            object.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            object.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            object.bottomAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            object.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            object.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            object.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            object.centerXAnchor.constraint(equalTo: parentView.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            object.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            object.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil, topCG != nil {
            object.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil, bottomCG != nil {
            object.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil, leadingCG != nil {
            object.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil, trailingCG != nil {
            object.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
    
    func shadow<T: UIView>(object: T ,
                                    color: UIColor? = nil,
                                    radius: CGFloat? = nil,
                                    opacity: Float? = nil,
                                    offset: CGSize? = nil,
                                    path: CGPath? = nil)
    {
        if color != nil {
            object.layer.shadowColor = color!.cgColor
        }
        if radius != nil {
            object.layer.shadowRadius = radius!
        }
        if opacity != nil {
            object.layer.shadowOpacity = opacity!
        }
        if offset != nil {
            object.layer.shadowOffset = offset!
        }
        if path != nil {
            object.layer.shadowPath = path!
        }
    }



func genericlLayout<ObjectUIView: UIView, ParentView: UIView>(object: ObjectUIView,
                                                                  parentView: ParentView,
                                                                  width: CGFloat? = nil,
                                                                  height: CGFloat? = nil,
                                                                  topC: CGFloat? = nil,
                                                                  bottomC: CGFloat? = nil,
                                                                  leadingC: CGFloat? = nil,
                                                                  trailingC: CGFloat? = nil,
                                                                  centerV: CGFloat? = nil,
                                                                  centerH: CGFloat? = nil,
                                                                  centerVtoO: Any? = nil,
                                                                  centerHtoO: Any? = nil,
                                                                  topToO: Any? = nil,
                                                                  topCG: CGFloat? = 0,
                                                                  bottomToO: Any? = nil,
                                                                  bottomCG: CGFloat? = 0,
                                                                  leadingToO: Any? = nil,
                                                                  leadingCG: CGFloat? = 0,
                                                                  trailingToO: Any? = nil,
                                                                  trailingCG: CGFloat? = 0)
    {
        object.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(object)
        
        if width != nil {
            object.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        if height != nil {
            object.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if topC != nil {
            object.topAnchor.constraint(equalTo: parentView.topAnchor, constant: topC!).isActive = true
        }
        if bottomC != nil {
            object.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -bottomC!).isActive = true
        }
        if leadingC != nil {
            object.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: leadingC!).isActive = true
        }
        if trailingC != nil {
            object.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -trailingC!).isActive = true
        }
        if centerV != nil {
            object.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: centerV!).isActive = true
        }
        if centerH != nil {
            object.centerXAnchor.constraint(equalTo: parentView.centerXAnchor, constant: centerH!).isActive = true
        }
        if centerVtoO != nil {
            object.centerYAnchor.constraint(equalTo: centerVtoO! as! NSLayoutAnchor<NSLayoutYAxisAnchor>).isActive = true
        }
        if centerHtoO != nil {
            object.centerXAnchor.constraint(equalTo: centerHtoO! as! NSLayoutAnchor<NSLayoutXAxisAnchor> ).isActive = true
        }
        if topToO != nil {
            object.topAnchor.constraint(equalTo: topToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: topCG!).isActive = true
        }
        if bottomToO != nil {
            object.bottomAnchor.constraint(equalTo: bottomToO! as! NSLayoutAnchor<NSLayoutYAxisAnchor> , constant: -bottomCG!).isActive = true
        }
        if leadingToO != nil {
            object.leadingAnchor.constraint(equalTo: leadingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: leadingCG!).isActive = true
        }
        if trailingToO != nil {
            object.trailingAnchor.constraint(equalTo: trailingToO! as! NSLayoutAnchor<NSLayoutXAxisAnchor>  , constant: -trailingCG!).isActive = true
        }
    }
}
