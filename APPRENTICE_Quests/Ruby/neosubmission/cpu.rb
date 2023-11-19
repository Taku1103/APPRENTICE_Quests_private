class CPU < BJ_player
  # ドローメソッド
  def cpu_draw(deck_obj)
    while @score < AUTO_DRAW_LIMIT_SCORE
      deck_obj.dealing(self)
      calculate
      show_latest_draw
    end
  end
end
