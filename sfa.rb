#■ＳＦＡ−サイエンスフィクションオートメーション−

#変数設定
f_length = 0
f_rand = 0

#配列指定
f_text = []
f_print = []

#ファイル格納場所
f_text[0] = '1.txt'
f_text[1] = '2.txt'
f_text[2] = '3.txt'

#入力
f_text.each_with_index{|txt,i|
  open(txt) {|file|
    #ファイル内行数調査
    f_length = file.readlines.length
    #ランダムに特定行を指定
    f_rand = rand(f_length)
  }
  
  #同じopen内で行数調べるのと中身返すのは
  #同時にできないようなので、もう一度ファイルをopen。
  open(txt) {|file|
    #上記で指定した行の中身を配列に格納
    f_print[i] = file.readlines[f_rand]
  }
}

#出力
f_print.each{|tango|
  #改行を取り除く
  tango = tango.gsub(/\r/, '').gsub(/\n/, '') 

  #出力
  print tango
}
puts ''
