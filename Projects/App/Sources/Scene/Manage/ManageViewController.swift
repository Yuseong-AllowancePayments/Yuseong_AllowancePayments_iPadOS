import UIKit
import SnapKit
import Then
import RxSwift
import DesignSystem

class ManageViewController: BaseVC {
    private let titleLabel = UILabel().then {
        $0.text = "참전유공자 배우자 수당 지급 대상자 조회"
        $0.textColor = .Colors.GrayScale.g90.color
        $0.font = UIFont.pretendard(.h1)
    }
    private let noticeLabel = UILabel().then {
        $0.text = "*셀을 터치하여 데이터를 바로 수정할 수 있습니다."
        $0.textColor = .Colors.System.red.color
        $0.font = .pretendard(.p2)
    }

    override func addView() {
        [
            titleLabel,
            noticeLabel
        ].forEach { self.view.addSubview($0) }
    }

    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(64)
            $0.top.equalToSuperview().inset(60)
        }
        noticeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(64)
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
        }
    }
}
