import UIKit

class SectionHeaderView: UITableViewHeaderFooterView {

    static let identifier = "SectionHeaderView"
    let titleLabel = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func setupUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 20)
        contentView.backgroundColor = UIColor.systemGray5

        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
        ])
    }
}
