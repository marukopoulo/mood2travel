
# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'

require 'mechanize'

def say_hi
  puts "Hello, Ruby!!"
end

def get_title(link_title)

    html = open(link_title) do |f|
      f.read
    end
    doc = Nokogiri::HTML.parse(html.toutf8,nil,'utf-8')
    title = doc.css('div.bn_content_text').css('li').text
    txt = "tokyo,yokohama,nara"
    @titles = title.split("！")
    puts @titles[1]
  end


agent = Mechanize.new
page = agent.get('http://bn.merumo.ne.jp/backno/listView.do?page=4&magId=00186490')
agent.page.encoding = 'Shift-JIS'
p agent.page.parser.errors
url_for_title = page.uri.to_s
p url_for_title
p page.body
get_title(url_for_title)
p agent.page.search('div.bn_content_text li').text

@titles[0..5].each do |title|
         next_page = page.link_with(:text => /.01./).click
         link = next_page.uri
         p link
end


#next_page = page.link_with(:text => '%r!短い英文から始めよう！'').click

def test
  agent = Mechanize.new
  page = agent.get('http://bn.merumo.ne.jp/backno/listView.do?magId=00186490')
  puts "hellowolddd"
end



# スクレイピング先のURL
url = 'http://bn.merumo.ne.jp/backno/bodyView.do?issueId=2014013122500000186490000'

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end
test
# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

# タイトルを表示
p doc.css('div.bn_head').text
p doc.css('div.bn_content_text').inner_text




say_hi


