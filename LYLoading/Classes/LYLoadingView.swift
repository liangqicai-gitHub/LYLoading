//
//  LQCLoadingView.swift
//  account
//
//  Created by mac on 2022/5/13.
//

import UIKit
import SnapKit
import QuartzCore


public class LYLoadingView: UIView {
    
    @IBOutlet weak var realContainer: UIView!
    @IBOutlet weak var animation: UIView!
    
    let realContainerWidth: CGFloat = 50
    let realContainerHight: CGFloat = 50
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        realContainer.backgroundColor = UIColor.clear
        animation.layer.addSublayer(animationnLayer)
    }
    
    
    
    func showAnimaiton() {
        let beginTime: Double = 0.5
        let durationStart: Double = 1.2
        let durationStop: Double = 0.7

        let animationRotation = CABasicAnimation(keyPath: "transform.rotation")
        animationRotation.byValue = 2 * Float.pi
        animationRotation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)

        let animationStart = CABasicAnimation(keyPath: "strokeStart")
        animationStart.duration = durationStart
        animationStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0, 0.2, 1)
        animationStart.fromValue = 0
        animationStart.toValue = 1
        animationStart.beginTime = beginTime

        let animationStop = CABasicAnimation(keyPath: "strokeEnd")
        animationStop.duration = durationStop
        animationStop.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0, 0.2, 1)
        animationStop.fromValue = 0
        animationStop.toValue = 1

        let animation = CAAnimationGroup()
        animation.animations = [animationRotation, animationStop, animationStart]
        animation.duration = durationStart + beginTime
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards

        animationnLayer.add(animation, forKey: "animation")
    }
    
    
    func hideAnimation() {
        animationnLayer.removeAllAnimations()
    }
    
    
    lazy var animationnLayer: CAShapeLayer = {
        let path = UIBezierPath(
            arcCenter: CGPoint(x: realContainerWidth/2, y: realContainerHight/2),
            radius: realContainerWidth/2,
            startAngle: -0.5 * .pi, endAngle: 1.5 * .pi,
            clockwise: true
        )
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 0, y: 0, width: realContainerWidth, height: realContainerHight)
        layer.path = path.cgPath
        layer.fillColor = nil
        layer.lineWidth = 3
        return layer
    }()
    
}


extension UIView {
    
    private struct AssociatedKeys_lqcLoading {
        static var loadingHud = "AssociatedKeys_lqcLoading.loadingHud"
    }
    
    private var ly_loadingHud: LYLoadingView? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys_lqcLoading.loadingHud, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            guard let rs = objc_getAssociatedObject(self, &AssociatedKeys_lqcLoading.loadingHud) as? LYLoadingView else {
                let myBundle = Bundle(for: LYLoadingView.self)
                guard
                    let path = myBundle.path(forResource: "LYLoading", ofType: "bundle"),
                    let assetsBundle = Bundle.init(path: path),
                    let hud = assetsBundle.loadNibNamed("LYLoadingView", owner: nil, options: nil)?.first as? LYLoadingView
                else {
                    return nil
                }
                objc_setAssociatedObject(self, &AssociatedKeys_lqcLoading.loadingHud, hud, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return hud
            }
            return rs
        }
    }
    
    public func ly_showLoading(
        backgroundColor: UIColor = .clear,
        animationColor: UIColor = .orange
    ) {
        ly_hideLoading()
        guard let hud = ly_loadingHud else {
            return
        }
        
        hud.backgroundColor = backgroundColor
        hud.animationnLayer.strokeColor = animationColor.cgColor
        addSubview(hud)
        hud.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
        ly_loadingHud?.showAnimaiton()
    }
    
    public func ly_hideLoading() {
        ly_loadingHud?.animationnLayer.removeAllAnimations()
        ly_loadingHud?.removeFromSuperview()
        ly_loadingHud = nil
    }
}
