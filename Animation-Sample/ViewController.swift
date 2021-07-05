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
    
    @IBAction private func buttonDidTapped(_ sender: Any) {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shapeLayer.add(animation, forKey: nil)
    }
    
    
}

