//
//  ViewController.swift
//  Animation-Sample
//
//  Created by 大西玲音 on 2021/07/04.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var myView: UIView!
    
    private var shapeLayer: CAShapeLayer!
    private var path: UIBezierPath!
    private var height: CGFloat { myView.frame.size.height }
    private var width: CGFloat { myView.frame.size.width }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMyView()
        
    }
    
    private func setupMyView() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: width / 2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: height / 2))
        path.addLine(to: CGPoint(x: width / 2, y: height))
        path.addLine(to: CGPoint(x: width, y: height / 2))
        path.close()
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 3
        myView.layer.mask = shapeLayer
    }
    
    // MARK: - CABasicAnimation
    @IBAction private func CABasicButtonDidTapped(_ sender: Any) {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        shapeLayer.add(animation, forKey: nil)
    }
    
    // MARK: - CAKeyframeAnimation
    @IBAction private func CAKeyframeButtonDidTapped(_ sender: Any) {
        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addCurve(to: CGPoint(x: 100, y: 100),
                      control1: CGPoint(x: 0, y: 100),
                      control2: CGPoint(x: 100, y: 100))
        path.addCurve(to: CGPoint(x: -100, y: 100),
                      control1: CGPoint(x: -50, y: 50),
                      control2: CGPoint(x: 100, y: -100))
        animation.path = path
        animation.duration = 3
        shapeLayer.add(animation, forKey: nil)
    }
    
    // MARK: - CAAnimationGroup
    @IBAction private func CAGroupButtonDidTapped(_ sender: Any) {
        
    }
    
    // MARK: - CATransaction
    @IBAction private func CATransactionButtonDidTapped(_ sender: Any) {
        
    }
    
}

