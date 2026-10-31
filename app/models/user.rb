class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :horses, dependent: :destroy
  has_many :instructors, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_one_attached :icon

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 100 }

  GUEST_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "ゲスト"
    end
  end

  def guest?
    email == GUEST_EMAIL
  end

  def reset_guest_data!
    lessons.destroy_all
    horses.destroy_all
    instructors.destroy_all
    update!(nickname: "ゲスト", introduction: "乗馬歴1年。駈歩を練習中です。")

    sakura = horses.create!(name: "サクラ", color: Color.find_by(name: "鹿毛"),
                            personality: "少し臆病なところもあるが、慣れるととても優しい。", memo: "駈歩が得意。")
    hana = horses.create!(name: "ハナ", color: Color.find_by(name: "芦毛"),
                          personality: "のんびり屋。", memo: "止まりやすいので脚を使う。")
    sato = instructors.create!(name: "佐藤先生", feature: "姿勢を細かく見てくれる。")
    suzuki = instructors.create!(name: "鈴木先生", feature: "褒めて伸ばしてくれる。")

    lessons.create!(date: Date.current - 3, horse: sakura, instructor: sato,
                    categories: Category.where(name: [ "軽速歩", "駈歩" ]),
                    instruction: "駈歩の発進は外方の脚をしっかり使う。手綱を引きすぎないこと。",
                    impression: "最初は少し不安定だったけど、後半はリズムよく乗れた。",
                    next_goal: "駈歩を安定させる")
    lessons.create!(date: Date.current - 8, horse: sakura, instructor: suzuki,
                    categories: Category.where(name: [ "速歩" ]),
                    instruction: "速歩では、かかとを下げて重心を安定させる。",
                    impression: "先生に褒めてもらえた！",
                    next_goal: "駈歩に挑戦する")
    lessons.create!(date: Date.current - 15, horse: hana, instructor: sato,
                    categories: Category.where(name: [ "並足", "軽速歩" ]),
                    instruction: "軽速歩は、馬の突き上げに合わせて立ち座りする。",
                    impression: "リズムがつかめてきた。",
                    next_goal: "つま先を下げて乗る")
  end
end
