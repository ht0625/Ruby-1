# class Player を定義
class Player
  def hand
    # プレイヤーに 0 ~ 2を入力させる
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    # 変数「input_hand」にプレイヤーが入力したものを取得して代入
    #input_hand = gets.chomp(11行目にまとめて記述)
      # 取得した値が文字列　"0" "1" "2" でない間もしくはあいこの間、下記を繰り返し実行
      while true
        input_hand = gets.chomp
        # 取得した値が文字列　"0" "1" "2" であった場合、数値に変換 →値を返す
        if (input_hand == "0" || input_hand == "1" || input_hand == "2")
          input_hand = input_hand.to_i
          return input_hand
        # 文字列　"0" "1" "2"以外が入力された場合、もう一度入力を求め、文字列として取得する
        else
          puts "もう一度数字を入力してください。"
          puts "0:グー, 1:チョキ, 2:パー"
          #input_hand = gets.chomp(11行目にまとめて記述)
        end
      end
  end
end
# class Enemyを定義
class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力
    rand(0..2)
  end
end
# class Jankenを定義
class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    # 勝敗判定し結果出力後、true or false の値を返す
    case (player_hand - enemy_hand + 3) % 3
    when 2
      puts "相手の手は#{janken[enemy_hand]}です。あなたの勝ちです。"
      return false
    when 1
      puts "相手の手は#{janken[enemy_hand]}です。あなたの負けです。"
      return false
    when 0
      puts "相手の手は#{janken[enemy_hand]}です。あいこです。"
      return true
    end
  end
end
player = Player.new
enemy = Enemy.new
janken = Janken.new
next_game = true
while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end
