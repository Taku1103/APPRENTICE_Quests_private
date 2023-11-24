class Deck
  attr_accessor :name, :used_cards, :deck_arr

  def initialize(name)
    @name = name
    # ループ毎に初期化
    @deck_arr = []
    @used_cards = []
  end

  # ループ初期化
  def loop_init
    @deck_arr = []
    @used_cards = []
  end

  # デッキ作成メソッド
  def deck_making
    suits = ['Heart', 'Diamond', 'Club', 'Spade']
    nums = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
    suits.each do |suit|
      nums.each do |num|
        @deck_arr << [num, suit]
      end
    end
  end

  # デッキからランダムカード排出メソッド（被り無し）
  def select_card
    available_cards = @deck_arr - @used_cards   # 配列の差分
    selected_card = available_cards.sample # ランダム1枚
    @used_cards << selected_card           # 使用したカードを記録
    return selected_card
  end

  # 配布メソッド
  def dealing(bj_player_obj)
    bj_player_obj.hand << select_card
  end
end
