import UIKit
import DesignSystem
import Then
import SnapKit

class LaunchScreenViewController: BaseVC {
    private let logoImageView = UIImageView().then {
        $0.image = .Image.logo
        $0.contentMode = .scaleAspectFit
    }
    override func addView() {
        self.view.addSubview(logoImageView)
    }
    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(160)
            $0.top.equalToSuperview().inset(356)
            $0.bottom.equalToSuperview().inset(360)
        }
    }
}
