class Impression < ActiveHash::Base
  self.data = [
    { id: 1, name: "--" },
    { id: 2, name: "閉じている" },
    { id: 3, name: "控えめ" },
    { id: 4, name: "しっかりと感じられる" },
    { id: 5, name: "力強い" },
    { id: 6, name: "チャーミングな" },
    { id: 7, name: "華やかな" },
    { id: 8, name: "濃縮感がある" },
    { id: 9, name: "深みのある" },
    { id: 10, name: "複雑な" }
  ]
end
