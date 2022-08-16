//
//  Anchor+Extension.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 16.08.2022.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?,
                   leading:NSLayoutXAxisAnchor?,
                   bottom: NSLayoutYAxisAnchor?,
                   trailing: NSLayoutXAxisAnchor?,
                   padding: UIEdgeInsets = .zero,
                   size: CGSize = .zero) {
           
           translatesAutoresizingMaskIntoConstraints = false
           
           guard let top = top,
               let leading = leading,
               let bottom = bottom,
               let trailing = trailing
               else { return }
           
           topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
           leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
           bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
           trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
           
           
           if size.width != 0 {
               widthAnchor.constraint(equalToConstant: size.width).isActive = true
           }
           
           if size.height != 0 {
               heightAnchor.constraint(equalToConstant: size.height).isActive = true
           }
       }
    
}
