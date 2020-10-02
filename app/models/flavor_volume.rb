class FlavorVolume < ActiveHash::Base
  self.data = [
    { id: 1, name: "--" },
    { id: 2, name: "控えめ" },
    { id: 3, name: "やや強い" },
    { id: 4, name: "強い" },
    { id: 5, name: "豊か" }
  ]
end
