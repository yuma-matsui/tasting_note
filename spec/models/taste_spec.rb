require 'rails_helper'

RSpec.describe Taste, type: :model do
  before do
    @taste = FactoryBot.build(:taste)
  end

  describe 'ノート作成' do
    context '作成がうまくいく時' do
      it 'attack_id, alcohol_level_id, acidity_level_id, tannic_level_id, after_flavor_id, description_id, commentが存在すれば登録できる事' do
        expect(@taste).to be_valid
      end
  end

    context '作成がうまくいかない時' do
    it 'commentが空の場合' do
      @taste.comment = nil
      @taste.valid?
      expect(@taste.errors.full_messages).to include("コメントを入力してください")
    end

    it 'attack_idが空の場合' do
      @taste.attack_id = '1'
      @taste.valid?
      expect(@taste.errors.full_messages).to include("アタックを選択してください")
    end

    it 'alcohol_level_idが空の場合' do
      @taste.alcohol_level_id = '1'
      @taste.valid?
      expect(@taste.errors.full_messages).to include("アルコールを選択してください")
    end

    it 'acidity_level_idが空の場合' do
      @taste.acidity_level_id = '1'
      @taste.valid?
      expect(@taste.errors.full_messages).to include("酸味を選択してください")
    end

    it 'after_flavor_idが空の場合' do
      @taste.after_flavor_id = '1'
      @taste.valid?
      expect(@taste.errors.full_messages).to include("余韻を選択してください")
    end

    it 'description_idが空の場合' do
      @taste.description_id = '1'
      @taste.valid?
      expect(@taste.errors.full_messages).to include("バランスを選択してください")
    end
  end
end

end
