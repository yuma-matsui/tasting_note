require 'rails_helper'

RSpec.describe Flavor, type: :model do
  before do
    @flavor = FactoryBot.build(:flavor)
  end

  describe 'ノート作成' do
    context '作成がうまくいく時' do
      it 'impression_id, flavor_volume_id, first_flavor_id, commentが存在すれば登録できる事' do
        expect(@flavor).to be_valid
      end

      it 'second_flavorが空でも登録できる事' do
        @flavor.second_flavor_id = "1"
        expect(@flavor).to be_valid
      end

      it 'third_flavorが空でも登録できる事' do
        @flavor.third_flavor_id = "1"
        expect(@flavor).to be_valid
      end
    end

    context '作成がうまくいかない時' do

      it 'commentが空の場合' do
        @flavor.comment = nil
        @flavor.valid?
        expect(@flavor.errors.full_messages).to include("コメントを入力してください")
      end

      it 'impression_idが空の場合' do
        @flavor.impression_id = '1'
        @flavor.valid?
        expect(@flavor.errors.full_messages).to include("第一印象を選択してください")
      end

      it 'flavor_volume_idが空の場合' do
        @flavor.flavor_volume_id = '1'
        @flavor.valid?
        expect(@flavor.errors.full_messages).to include("香りの印象を選択してください")
      end

      it 'first_flavor_idが空の場合' do
        @flavor.first_flavor_id = '1'
        @flavor.valid?
        expect(@flavor.errors.full_messages).to include("第一アロマを選択してください")
      end
    end
  end

end
