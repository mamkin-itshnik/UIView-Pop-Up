import Foundation
import UIKit

extension UIViewController {
    
    enum OutEvent{
        case close
        case custom(complition:()->())
    }

    class BackgroundView:UIView{
        
        var outTouchHandler:(()->())?
        
        open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesEnded(touches, with: event)
            guard let touchPoint = touches.first?.location(in: self) else { return }
            guard self.bounds.contains(touchPoint) else { return }
            (outTouchHandler ?? {})()
        }
    }
    
    func showSubview(upperView: UIView?,
                     completion: OutEvent,
                     bgColor: UIColor = .black,
                     alpha: CGFloat = 0.5 ){
        
        guard let upperView = upperView else { return }
        
        let background = BackgroundView(frame: view.frame)
        view.addSubview(background)
       
        background.backgroundColor = bgColor.withAlphaComponent(alpha)
        background.translatesAutoresizingMaskIntoConstraints = false
        
        background.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        background.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        background.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
                
        background.addSubview(upperView)
        
        switch completion {
        case .close:
            background.outTouchHandler = {
                upperView.removeFromSuperview()
                background.removeFromSuperview()
            }
        case .custom(let completion):
            background.outTouchHandler = completion
        }
    }
}
