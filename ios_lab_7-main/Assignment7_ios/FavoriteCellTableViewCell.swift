import UIKit

class FavoriteCell: UITableViewCell {

    let itemImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let reviewLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func setupUI() {
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = .boldSystemFont(ofSize: 16)
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.textColor = .gray

        reviewLabel.font = .systemFont(ofSize: 13)
        reviewLabel.numberOfLines = 0

        itemImageView.layer.cornerRadius = 8
        itemImageView.clipsToBounds = true
        itemImageView.contentMode = .scaleAspectFill

        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(reviewLabel)

        NSLayoutConstraint.activate([
            // Image
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            itemImageView.widthAnchor.constraint(equalToConstant: 70),
            itemImageView.heightAnchor.constraint(equalToConstant: 70),

            // Title
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            // Subtitle
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 12),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            // Review
            reviewLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 6),
            reviewLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 12),
            reviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            reviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    func configure(with item: FavoriteItem) {
        itemImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
    }
}
