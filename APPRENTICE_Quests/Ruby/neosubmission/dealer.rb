# require_relative 'bj_player'

class Dealer < BJ_player
  # ドローメソッド（17以上までドロー）
  def dealer_draw(deck_obj, deck)
    show_hand
    show_score
    while @score < AUTO_DRAW_LIMIT_SCORE
      deck_obj.dealing(deck, self)
      calculate
      show_latest_draw
      show_score
    end
  end

  # 手札1枚公開
  def show_one_hand
    puts "#{@name}の引いたカードは #{@hand[0]}です。"
    puts "#{@name}の引いた2枚目のカードはわかりません。"
  end
end
