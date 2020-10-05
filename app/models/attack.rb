class Attack < ActiveHash::Base
  self.data = [
    { id: 1, name: "--" },
    { id: 2, name: "軽い" },
    { id: 3, name: "やや軽い" },
    { id: 4, name: "やや強い" },
    { id: 5, name: "強い" },
    { id: 6, name: "インパクトのある" }
  ]
end
