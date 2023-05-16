//
//  Button.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

class Button: UIButton {
    init(image: UIImage? = nil, tag: Int, textFont: UIFont? = nil, textColor: UIColor? = nil, titleText: String? = nil, backgroundColor: UIColor? = nil) {
        super.init(frame: .zero)
        self.setImage(image, for: .normal)
        self.tag = tag
        self.titleLabel?.font = textFont
        self.setTitle(titleText, for: .normal)
        self.backgroundColor = backgroundColor
        setTitleColor(textColor, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable var buttonRadius: CGFloat = 0 {
        didSet {
            if buttonRadius < 0 {
                layer.cornerRadius = frame.height / 2
            } else {
                layer.cornerRadius = buttonRadius
            }
        }
    }
    
    @IBInspectable var normalBackgroundColor: UIColor? {
        didSet {
            backgroundColor = normalBackgroundColor
        }
    }
    
    @IBInspectable var highlightedBackgroundColor: UIColor?
    
    @IBInspectable var maskedCorner: CGFloat = 3 {
        didSet {
            if maskedCorner == 1 {
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            } else if maskedCorner == 2 {
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            } else if maskedCorner == 3{
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner,.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if oldValue == false && isHighlighted {
                highlight()
            } else if oldValue == true && !isHighlighted {
                unHighlight()
            }
        }
    }
    
    var highlightDuration: TimeInterval = 0.2
    
    private func animateBackground(to color: UIColor?, duration: TimeInterval) {
        guard let color = color else { return }
        UIView.animate(withDuration: highlightDuration) {
            self.backgroundColor = color
        }
    }
    
    func highlight() {
        animateBackground(to: highlightedBackgroundColor, duration: highlightDuration)
    }
    
    func unHighlight() {
        animateBackground(to: normalBackgroundColor, duration: highlightDuration)
    }
}
