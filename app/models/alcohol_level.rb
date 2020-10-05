class AlcoholLevel < ActiveHash::Base
  self.data = [
    { id: 1, name: "--" },
    { id: 2, name: "控えめ" },
    { id: 3, name: "やや軽め" },
    { id: 4, name: "中程度" },
    { id: 5, name: "やや強め" },
    { id: 6, name: "熱さを感じる" }
  ]
end
