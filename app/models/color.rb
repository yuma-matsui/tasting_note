class Color < ActiveHash::Base
  self.data = [
    { id: 1, name: "--" },
    { id: 2, name: "白" },
    { id: 3, name: "赤" },
    { id: 4, name: "ロゼ" },
    { id: 5, name: "スパークリング" }
  ]
end
