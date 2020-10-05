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
        expect(@look.errors.full_messages).to include("Image can't be blank")
      end

      it 'commentが空の場合' do
        @look.comment = nil
        @look.valid?
        expect(@look.errors.full_messages).to include("Comment can't be blank")
      end

      it 'color_tone_idが空の場合' do
        @look.color_tone_id = '1'
        @look.valid?
        expect(@look.errors.full_messages).to include("Color tone must be other than 1")
      end

      it 'intensity_idが空の場合' do
        @look.intensity_id = '1'
        @look.valid?
        expect(@look.errors.full_messages).to include("Intensity must be other than 1")
      end

      it 'brightness_idが空の場合' do
        @look.brightness_id = '1'
        @look.valid?
        expect(@look.errors.full_messages).to include("Brightness must be other than 1")
      end

      it 'viscosity_idが空の場合' do
        @look.viscosity_id = '1'
        @look.valid?
        expect(@look.errors.full_messages).to include("Viscosity must be other than 1")
      end

    end
  end

end
