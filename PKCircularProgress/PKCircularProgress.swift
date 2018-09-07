//
//  PKCircularProgress.swift
//  PKCircularProgress
//
//  Created by Pravin Kulkarni on 07/09/18.
//  Copyright © 2018 Pravin Kulkarni. All rights reserved.
//

import UIKit

public class PKCircularProgress: UIView {
        
        public var progressLayer = CAShapeLayer()
        public var tracklayer = CAShapeLayer()
        
        override public init(frame: CGRect) {
            super.init(frame: frame)
            createCircularPath()
        }
        
        required public init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            createCircularPath()
        }
        
        public var progressColor:UIColor = UIColor.red {
            didSet {
                progressLayer.strokeColor = progressColor.cgColor
            }
        }
        
        public var trackColor:UIColor = UIColor.white {
            didSet {
                tracklayer.strokeColor = trackColor.cgColor
            }
        }
        
        public func createCircularPath() {
            self.backgroundColor = UIColor.clear
            self.layer.cornerRadius = self.frame.size.width/2.0
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
                                          radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * Double.pi),
                                          endAngle: CGFloat(1.5 * Double.pi), clockwise: true)
            
            tracklayer.path = circlePath.cgPath
            tracklayer.fillColor = UIColor.clear.cgColor
            tracklayer.strokeColor = trackColor.cgColor
            tracklayer.lineWidth = 15.0;
            tracklayer.strokeEnd = 1.0
            layer.addSublayer(tracklayer)
            
            progressLayer.path = circlePath.cgPath
            progressLayer.fillColor = UIColor.clear.cgColor
            progressLayer.strokeColor = progressColor.cgColor
            progressLayer.lineCap = kCALineCapRound
            progressLayer.lineWidth = 15.0;
            progressLayer.strokeEnd = 0.0
            layer.addSublayer(progressLayer)
            
        }
        
        public func setProgressWithAnimation(duration: TimeInterval, value: Float) {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = duration
            // Animate from 0 (no circle) to 1 (full circle)
            animation.fromValue = 0
            animation.toValue = value
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            progressLayer.strokeEnd = CGFloat(value)
            progressLayer.add(animation, forKey: "animateCircle")
        }
}
