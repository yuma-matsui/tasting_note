class Intensity < ActiveHash::Base
  self.data = [
    { id: 1, name: "--" },
    { id: 2, name: "薄い(無色に近い)" },
    { id: 3, name: "やや明るい" },
    { id: 4, name: "明るい" },
    { id: 5, name: "やや濃い" },
    { id: 6, name: "濃い" },
    { id: 7, name: "非常に濃い" }
  ]
end
