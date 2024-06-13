class Contribution < ActiveHash::Base
  self.data = [
    { id: 1, contribution: '---' },
    { id: 2, contribution: '着払い(購入者負担)' },
    { id: 3, contribution: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items
end