require 'rails_helper'

RSpec.describe Look, type: :model do
  before do
    @look = FactoryBot.build(:look)
    @look.image = fixture_file_upload('public/images/taste.new.jpg')
  end

  describe 'ノート作成' do
    context 'ノートが作成できるとき' do
      it 'image, color_tone_id, intensity_id, brightness_id, viscosity_id, commentが存在すれば登録できる事' do
        expect(@look).to be_valid
      end
    end

    context 'ノート作成がうまくいかない時' do
      it 'imageが空の場合' do
        @look.image = nil
        @look.valid?
        expect(@look.errors.full_messages).to include("画像を入力してください")
      end

      it 'commentが空の場合' do
        @look.comment = nil
        @look.valid?
        expect(@look.errors.full_messages).to include("コメントを入力してください")
      end

      it 'color_tone_idが空の場合' do
        @look.color_tone_id = '1'
        @look.valid?
        expect(@look.errors.full_messages).to include("色調を選択してください")
      end

      it 'intensity_idが空の場合' do
        @look.intensity_id = '1'
        @look.valid?
        expect(@look.errors.full_messages).to include("濃淡を選択してください")
      end

      it 'brightness_idが空の場合' do
        @look.brightness_id = '1'
        @look.valid?
        expect(@look.errors.full_messages).to include("輝きを選択してください")
      end

      it 'viscosity_idが空の場合' do
        @look.viscosity_id = '1'
        @look.valid?
        expect(@look.errors.full_messages).to include("粘性を選択してください")
      end

    end
  end

end
