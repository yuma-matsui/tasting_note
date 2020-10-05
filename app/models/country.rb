class Country < ActiveHash::Base
  self.data = [
    { id: 1, name: "--" },
    { id: 2, name: "フランス" },
    { id: 3, name: "イタリア" },
    { id: 4, name: "スペイン" },
    { id: 5, name: "アメリカ" },
    { id: 6, name: "チリ" },
    { id: 7, name: "オーストラリア" },
    { id: 8, name: "ニュージーランド" },
    { id: 9, name: "日本" },
    { id: 10, name: "南アフリカ" },
    { id: 11, name: "アルゼンチン" },
    { id: 12, name: "その他" }
  ]
end
