require 'rails_helper'

RSpec.describe Wine, type: :model do
  before do
    @wine = FactoryBot.build(:wine)
    @wine.image = fixture_file_upload('public/images/taste.new.jpg')
  end

  describe 'ノート作成' do
    context '作成ががうまくいく時' do
      it 'image, name, color_id, variety_id, country_id, vintage, alcohol_volume_idが存在すれば登録できる事' do
        expect(@wine).to be_valid
      end

      it 'regionが空でも登録できる事' do
        @wine.region = ""
        expect(@wine).to be_valid
      end

      it 'marriage_foodが空でも登録できる事' do
        @wine.marriage_food = ""
        expect(@wine).to be_valid
      end

      it 'producerが空でも登録できる事' do
        @wine.producer = ""
        expect(@wine).to be_valid
      end
    end

    context '作成がうまくいかない時' do
      it 'imagesが空の場合' do
        @wine.image = nil
        @wine.valid?
        expect(@wine.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空の場合' do
        @wine.name = nil
        @wine.valid?
        expect(@wine.errors.full_messages).to include("Name can't be blank")
      end

      it 'vintageが空の場合' do
        @wine.vintage = nil
        @wine.valid?
        expect(@wine.errors.full_messages).to include("Vintage can't be blank")
      end

      it 'color_idが空の場合' do
        @wine.color_id = '1'
        @wine.valid?
        expect(@wine.errors.full_messages).to include("Color must be other than 1")
      end

      it 'variety_idが空の場合' do
        @wine.variety_id = '1'
        @wine.valid?
        expect(@wine.errors.full_messages).to include("Variety must be other than 1")
      end

      it 'country_idが空の場合' do
        @wine.country_id = '1'
        @wine.valid?
        expect(@wine.errors.full_messages).to include("Country must be other than 1")
      end

      it 'alcohol_volume_idが空の場合' do
        @wine.alcohol_volume_id = '1'
        @wine.valid?
        expect(@wine.errors.full_messages).to include("Alcohol volume must be other than 1")
      end

    end
  end

end
