class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'バルーンアート' },
    { id: 3, name: '絵描き' },
    { id: 4, name: 'マジシャン' },
    { id: 5, name: '大道芸人' },
    { id: 6, name: 'ピエロ' },
    { id: 7, name: 'お笑い芸人' },
    { id: 8, name: 'ものまね芸人' },
    { id: 9, name: '歌手' },
    { id: 10, name: 'アイドル' },
    { id: 11, name: 'ダンサー' },
    { id: 12, name: '演劇役者' },
    { id: 13, name: 'ネイリスト' },
    { id: 14, name: 'マッサージ師' },
    { id: 15, name: '占い師' },
    { id: 16, name: 'その他' },
  ]

  include ActiveHash::Associations
  belongs_to :introductions
  has_many :performer

  end