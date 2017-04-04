# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all
User.destroy_all

Q1 = Question.create({name: '<p>くつに<abbr>石</abbr>が入っていました。</p>', description: '', qtype: 1, test_level: 4})
Answer.create({name: 'いし', description: '', question: Q1, correct: true})
Answer.create({name: 'すな', description: '', question: Q1})
Answer.create({name: 'くさ', description: '', question: Q1})
Answer.create({name: 'えだ', description: '', question: Q1})

Q2 = Question.create({name: '<p>にほんでいろいろな<abbr>経験</abbr>としました。</p>', description: '', qtype: 1, test_level: 4})
Answer.create({name: 'けいけん', description: '', question: Q2, correct: true})
Answer.create({name: 'けいげん', description: '', question: Q2})
Answer.create({name: 'けけん', description: '', question: Q2})
Answer.create({name: 'けげん', description: '', question: Q2})

Q3 = Question.create({name: '<p><abbr>店員</abbr>にトイレがどこにあるか聞きました。</p>', description: '', qtype: 1, test_level: 4})
Answer.create({name: 'てにん', description: '', question: Q3})
Answer.create({name: 'てんにん', description: '', question: Q3})
Answer.create({name: 'ていん', description: '', question: Q3})
Answer.create({name: 'てんいん', description: '', question: Q3, correct: true})

# Q4 = Question.create({name: '<p>きょうは<abbr>食堂</abbr>がこんでいました。</p>', description: '', qtype: 1, test_level: 4})
# Answer.create({name: 'しゅくど', description: '', question: Q4})
# Answer.create({name: 'しょくどう', description: '', question: Q4, correct: true})
# Answer.create({name: 'しょくど', description: '', question: Q4})
# Answer.create({name: 'しゅくどう', description: '', question: Q4})
#
# Q5 = Question.create({name: '<p>このまどから<abbr>港</abbr>が見えます。</p>', description: '', qtype: 1, test_level: 4})
# Answer.create({name: 'うみ', description: '', question: Q5})
# Answer.create({name: 'みなと', description: '', question: Q5, correct: true})
# Answer.create({name: 'みずうみ', description: '', question: Q5})
# Answer.create({name: 'いけ', description: '', question: Q5})
#
# Q6 = Question.create({name: '<p>この<abbr>小説</abbr>おもしろかったです。</p>', description: '', qtype: 1, test_level: 4})
# Answer.create({name: 'しょせつ', description: '', question: Q6})
# Answer.create({name: 'しょぜつ', description: '', question: Q6})
# Answer.create({name: 'しょうせつ', description: '', question: Q6, correct: true})
# Answer.create({name: 'しょうぜつ', description: '', question: Q6})
#
# Q7 = Question.create({name: '<p>まいばん<abbr>日記</abbr>を書いています。</p>', description: '', qtype: 1, test_level: 4})
# Answer.create({name: 'にっき', description: '', question: Q7, correct: true})
# Answer.create({name: 'にちき', description: '', question: Q7})
# Answer.create({name: 'にっきい', description: '', question: Q7})
# Answer.create({name: 'にちきい', description: '', question: Q7})
#
# Q8 = Question.create({name: '<p><abbr>夕方</abbr>雨がふりました。</p>', description: '', qtype: 1, test_level: 4})
# Answer.create({name: 'ゆうほう', description: '', question: Q8})
# Answer.create({name: 'ゆうがた', description: '', question: Q8, correct: true})
# Answer.create({name: 'ゆほう', description: '', question: Q8})
# Answer.create({name: 'ゆがた', description: '', question: Q8})
#
# Q9 = Question.create({name: '<p>もうすぐ<abbr>秋</abbr>ですね。</p>', description: '', qtype: 1, test_level: 4})
# Answer.create({name: 'ふゆ', description: '', question: Q9})
# Answer.create({name: 'なつ', description: '', question: Q9})
# Answer.create({name: 'はる', description: '', question: Q9})
# Answer.create({name: 'あき', description: '', question: Q9, correct: true})

# Set 2

Q10 = Question.create({name: '<p>すずきさんは <abbr>あおい</abbr> シャツを きて います。</p>', description: '', qtype: 2, test_level: 4})
Answer.create({name: '青い', description: '', question: Q10, correct: true})
Answer.create({name: '黒い', description: '', question: Q10})
Answer.create({name: '赤い', description: '', question: Q10})
Answer.create({name: '白い', description: '', question: Q10})

Q11 = Question.create({name: '<p>かいぎの <abbr>ばしょ</abbr>を おしえて ください。</p>', description: '', qtype: 2, test_level: 4})
Answer.create({name: '場所', description: '', question: Q11, correct: true})
Answer.create({name: '住所', description: '', question: Q11})
Answer.create({name: '台所', description: '', question: Q11})
Answer.create({name: '役所', description: '', question: Q11})

Q12 = Question.create({name: '<p>わたしの いえは えきから <abbr>あるいて</abbr> 5分です。</p>', description: '', qtype: 2, test_level: 4})
Answer.create({name: '歯して', description: '', question: Q12})
Answer.create({name: '散歩して', description: '', question: Q12})
Answer.create({name: '歩いて', description: '', question: Q12, correct: true})
Answer.create({name: '走って', description: '', question: Q12})

# Q13 = Question.create({name: '<p>ちかてつが できて <abbr>べんり</abbr>に なりました。</p>', description: '', qtype: 2, test_level: 4})
# Answer.create({name: '便利', description: '', question: Q13, correct: true})
# Answer.create({name: '便所', description: '', question: Q13})
# Answer.create({name: '便箋', description: '', question: Q13})
# Answer.create({name: '便乗', description: '', question: Q13})
#
# Q14 = Question.create({name: '<p>とても <abbr>ねむかった</abbr>ので、 コーヒーを 飲みました。</p>', description: '', qtype: 2, test_level: 4})
# Answer.create({name: '眠むかった', description: '', question: Q14, correct: true})
# Answer.create({name: '眠かった', description: '', question: Q14})
# Answer.create({name: '寝むかった', description: '', question: Q14})
# Answer.create({name: '寝かった', description: '', question: Q14})
#
# Q15 = Question.create({name: '<p>きょうは <abbr>ゆき</abbr>が ふって います。</p>', description: '', qtype: 2, test_level: 4})
# Answer.create({name: '電', description: '', question: Q15})
# Answer.create({name: '霅', description: '', question: Q15})
# Answer.create({name: '震', description: '', question: Q15})
# Answer.create({name: '雪', description: '', question: Q15, correct: true})

# Set 3

G1 = Question.create({name: '<p>わたしの 父は 中国語も 英語 <abbr>＿</abbr> 話せます。</p>', description: '', qtype: 3, test_level: 4})
Answer.create({name: 'を', description: '', question: G1})
Answer.create({name: 'で', description: '', question: G1})
Answer.create({name: 'も', description: '', question: G1, correct: true})
Answer.create({name: 'が', description: '', question: G1})

G2 = Question.create({name: '<p>これは わたしが 米 <abbr>＿</abbr> 作った パンです。</p>', description: '', qtype: 3, test_level: 4})
Answer.create({name: 'に', description: '', question: G2})
Answer.create({name: 'の', description: '', question: G2})
Answer.create({name: 'や', description: '', question: G2})
Answer.create({name: 'で', description: '', question: G2, correct: true})

G3 = Question.create({name: '<p>男の子の 顔は 父親より 母親 <abbr>＿</abbr> にると いう 話を 聞いた。</p>', description: '', qtype: 3, test_level: 4})
Answer.create({name: 'に', description: '', question: G3, correct: true})
Answer.create({name: 'へ', description: '', question: G3})
Answer.create({name: 'も', description: '', question: G3})
Answer.create({name: 'を', description: '', question: G3})

# G4 = Question.create({name: '<p>妹は おしゃべりだ。静かなのは、食事の とき <abbr>＿</abbr> だ。</p>', description: '', qtype: 3, test_level: 4})
# Answer.create({name: 'に', description: '', question: G4})
# Answer.create({name: 'へ', description: '', question: G4, correct: true})
# Answer.create({name: 'も', description: '', question: G4})
# Answer.create({name: 'を', description: '', question: G4})
#
# G5 = Question.create({name: '<p>A「誕生日に 田中さんから 何を もらったんですか。」</p><p>B「田中さん <abbr>＿</abbr> 腕時計（うでどけい）をもらいました。」</p>', description: '', qtype: 3, test_level: 4})
# Answer.create({name: 'からが', description: '', question: G5})
# Answer.create({name: 'からに', description: '', question: G5})
# Answer.create({name: 'からで', description: '', question: G5})
# Answer.create({name: 'からは', description: '', question: G5, correct: true})
#
# G6 = Question.create({name: '<p>会社で</p><p>A「すみません、やまださんは どこですか。」</p><p>B「山田（やまだ）さんは 会議中ですが、会議は11時半 <abbr>＿</abbr> 終わると思いますよ。」</p>', description: '', qtype: 3, test_level: 4})
# Answer.create({name: 'までは', description: '', question: G6})
# Answer.create({name: 'までには', description: '', question: G6, correct: true})
# Answer.create({name: 'までも', description: '', question: G6})
# Answer.create({name: 'までにも', description: '', question: G6})
#
# G7 = Question.create({name: '<p>学生「先生、この 言葉は <abbr>＿</abbr> 意味ですか。」</p><p>先生「『やさしい』と いう 意味です。」</p>', description: '', qtype: 3, test_level: 4})
# Answer.create({name: 'どうやって', description: '', question: G7})
# Answer.create({name: 'どのぐらい', description: '', question: G7})
# Answer.create({name: 'どういう', description: '', question: G7, correct: true})
# Answer.create({name: 'どう', description: '', question: G7})
#
# G12 = Question.create({name: '<p>この すいかは <abbr>＿</abbr> すぎて、れいぞうこに 入らない。</p>', description: '', qtype: 3, test_level: 4})
# Answer.create({name: '大き', description: '', question: G12, correct: true})
# Answer.create({name: '大きい', description: '', question: G12})
# Answer.create({name: '大きく', description: '', question: G12})
# Answer.create({name: '大きくて', description: '', question: G12})

User.create({email: 'admin@admin.com', password: '123456'})
User.create({email: 'user@user.com', password: '123456'})