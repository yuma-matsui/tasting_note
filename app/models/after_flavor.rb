class AfterFlavor < ActiveHash::Base
  self.data = [
    { id: 1, name: "--" },
    { id: 2, name: "短い"} ,
    { id: 3, name: "やや短い" },
    { id: 4, name: "やや長い"},
    { id: 5, name: "長い"}
  ]
end
