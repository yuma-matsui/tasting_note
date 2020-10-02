class TannicLevel < ActiveHash::Base
  self.data = [
    { id: 1, name: "--" },
    { id: 2, name: "収斂性のある" },
    { id: 3, name: "力強い" },
    { id: 4, name: "緻密" },
    { id: 5, name: "サラサラとした" },
    { id: 6, name: "ヴィロードのような" },
    { id: 7, name: "シルキーな" },
    { id: 8, name: "溶け込んだ" }
  ]
end
