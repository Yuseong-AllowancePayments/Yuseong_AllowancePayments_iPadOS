import UIKit
import DesignSystem
import Then
import SnapKit

class LaunchScreenViewController: UIViewController {
    private let logoImageView = UIImageView().then {
        $0.image = .Image.logo
        $0.contentMode = .scaleAspectFit
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
    }
    private func addView() {
        self.view.addSubview(logoImageView)
    }
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(160)
            $0.top.equalToSuperview().inset(356)
            $0.bottom.equalToSuperview().inset(360)
        }
    }
}
