class AcidityLevel < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'シャープな' },
    { id: 3, name: '爽やかな' },
    { id: 4, name: 'なめらかな' },
    { id: 5, name: '円みのある' },
    { id: 6, name: 'きめ細かい' },
    { id: 7, name: 'やさしい' },
    { id: 8, name: '力強い' }
  ]
end
