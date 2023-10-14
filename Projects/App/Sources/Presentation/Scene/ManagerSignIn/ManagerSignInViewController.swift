import UIKit
import SnapKit
import Then
import DesignSystem

class ManagerSignInViewController: BaseVC<ManagerSignInViewModel> {
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "AppIcon")
    }
    override func addView() {
        [
            logoImage
        ].forEach {
            view.addSubview($0)
        }
    }
    override func setLayout() {
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(430)
            $0.left.equalToSuperview().inset(310)
            $0.right.equalToSuperview().inset(658)
            $0.bottom.equalToSuperview().inset(886)
        }
    }
}
