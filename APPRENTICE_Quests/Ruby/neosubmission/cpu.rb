# require_relative 'bj_player'

class CPU < BJ_player
  # ドローメソッド
  def cpu_draw(deck_obj, deck)
    while @score < AUTO_DRAW_LIMIT_SCORE
      deck_obj.dealing(deck, self)
      calculate
      show_latest_draw
    end
  end
end
