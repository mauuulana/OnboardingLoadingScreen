
import UIKit

@IBDesignable
class CustomHorizontalProgressBar: UIView {
    
    private let barProgress = CALayer()
    private let barView = CAShapeLayer()

    @IBInspectable var color: UIColor = .white {
        didSet { setNeedsDisplay() }
    }

    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }

    private func setupViewBarProgress() {
        layer.addSublayer(barProgress)
    }

    override func draw(_ rect: CGRect) {
        barView.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.5).cgPath
        layer.mask = barView

        let progressingBar = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))

        barProgress.frame = progressingBar
        barProgress.backgroundColor = color.cgColor
    }

     override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewBarProgress()
    }


    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewBarProgress()
    }
}
