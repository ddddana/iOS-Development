import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    // Заголовки секций
    let sectionTitles = [
        "Favorite Movies 🎬",
        "Favorite Music 🎵",
        "Favorite Books 📚",
        "Favorite Courses 🎓"
    ]

    // Данные для таблицы (4 секции × 5 элементов)
    var allData: [[FavoriteItem]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Создаем фон
        let background = UIImageView(frame: view.bounds)
        background.image = UIImage(named: "background1")
        background.contentMode = .scaleAspectFill
        background.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(background, at: 0)

        // Настраиваем таблицу
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none

        // Регистрируем ячейку и header
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: "FavoriteCell")
        tableView.register(
            SectionHeaderView.self,
            forHeaderFooterViewReuseIdentifier: SectionHeaderView.identifier
        )

        // Загружаем данные
        setupData()
    }

    // Данные для таблицы
    func setupData() {
        allData = [

            // Movies
            [
                FavoriteItem(title: "The Intouchables", subtitle: "2011 • Olivier Nakache, Éric Toledano",
                             review: "Emotional, funny, and truly inspiring story.", imageName: "movie1"),
                FavoriteItem(title: "In Time", subtitle: "2011 • Andrew Niccol",
                             review: "A stylish sci-fi thriller about time, power, and survival.", imageName: "movie2"),
                FavoriteItem(title: "Howl’s Moving Castle", subtitle: "2004 • Hayao Miyazaki",
                             review: "A magical and heartwarming adventure with stunning animation.", imageName: "movie3"),
                FavoriteItem(title: "The Substance", subtitle: "2024 • Coralie Fargeat",
                             review: "Bold, shocking, and intense — a unique body-horror experience.", imageName: "movie4"),
                FavoriteItem(title: "The Shawshank Redemption", subtitle: "1994 • Frank Darabont",
                             review: "A powerful story about hope, friendship, and freedom.", imageName: "movie5")
            ],

            // Music
            [
                FavoriteItem(title: "SCIRENA – Конспект", subtitle: "2023 • Alt-Pop",
                             review: "Atmospheric and unique track with deep meaning.", imageName: "music1"),
                FavoriteItem(title: "Тимати – Не Сходи С Ума", subtitle: "2012 • Hip-Hop",
                             review: "A melodic and emotional song about relationship struggles.", imageName: "music2"),
                FavoriteItem(title: "Ulukmanapo & Bakr – Расстояние", subtitle: "2020 • Hip-Hop",
                             review: "Emotional track about feelings and distance between people", imageName: "music3"),
                FavoriteItem(title: "Macan – Кино", subtitle: "2023 • Hip-Hop",
                             review: "Energetic and bold track with strong delivery.", imageName: "music4"),
                FavoriteItem(title: "TASSO – Таю", subtitle: "2022 • Pop",
                             review: "Light, catchy song with warm and dreamy vibes.", imageName: "music5")
            ],

            // Books
            [
                FavoriteItem(title: "Dior: The Story of a Fashion House", subtitle: "Karen Homer • Fashion",
                             review: "A stylish overview of Dior’s heritage and evolution in the world of fashion.", imageName: "book1"),
                FavoriteItem(title: "The Lean Startup", subtitle: "Eric Ries • Business",
                             review: "A practical guide to building a sustainable and innovative startup from scratch.", imageName: "book2"),
                FavoriteItem(title: "The Psychology of Money", subtitle: "Morgan Housel • Finance",
                             review: "Timeless lessons about wealth, greed, and human behavior.", imageName: "book3"),
                FavoriteItem(title: "Murder on the Orient Express", subtitle: "Agatha Christie • Mystery",
                             review: "A classic detective story with brilliant suspense and an unforgettable twist.", imageName: "book4"),
                FavoriteItem(title: "The Little Prince", subtitle: "Antoine de Saint-Exupéry • Fiction",
                             review: "A gentle, philosophical tale about friendship, love, and the meaning of life.", imageName: "book5")
            ],

            // Courses
            [
                FavoriteItem(title: "UI/UX Design", subtitle: "Design & Interface",
                             review: "Loved creating intuitive interfaces.", imageName: "course1"),
                FavoriteItem(title: "Database Systems", subtitle: "SQL & Relational Models",
                             review: "Practical and useful for organizing data.", imageName: "course2"),
                FavoriteItem(title: "iOS Development", subtitle: "UIKit",
                             review: "Fun and engaging! Learned to build apps.", imageName: "course3"),
                FavoriteItem(title: "Web Development", subtitle: "HTML, CSS, JavaScript",
                             review: "Loved seeing code transform into сайт.", imageName: "course4"),
                FavoriteItem(title: "Principles of Programming (Python)", subtitle: "Python Fundamentals",
                             review: "Great course to build logic and problem-solving skills.", imageName: "course5")
            ]
        ]
    }

    // UITableView DataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return allData.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        let item = allData[indexPath.section][indexPath.row]
        cell.configure(with: item)
        return cell
    }

    // Section Headers

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionHeaderView.identifier) as! SectionHeaderView
        header.titleLabel.text = sectionTitles[section]
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}
