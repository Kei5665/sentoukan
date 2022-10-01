require 'rails_helper'

RSpec.describe 'Quests', type: :system do
  let(:near_shop) { create(:shop, name: '銀座湯', address: '住所1', latitude: 35.674653305483524, longitude: 139.77025262599443) }
  let(:far_shop) { create(:shop, name: '月島温泉', address: '住所2', latitude: 35.66375681411227, longitude: 139.78108269715878) }

  # ログインする
  before do
    visit root_path
    click_on 'スタート'
    expect(page).to have_content 'ようこそ！ゲストさん'
  end

  describe '現在地が1km圏内だった場合' do
    before do      
      near_shop
      click_on '周辺を検索'
      expect(current_path).to eq(maps_path)
      pin = find('map#gmimap1 area', visible: false)
      pin.click
      click_on 'ここに行く'
      expect(page).to have_content('クエストを開始します！')
    end

    it 'クエスト画面に遷移している', js: true  do
      expect(page).to have_content('銀座湯')
      expect(page).to have_content('目的地まで')
    end

    it 'クエストをクリアできる' do
      click_on 'クエストを完了する'
      expect(page).to have_content('お疲れ様でした！')
    end
  end

  describe '現在地が1km圏外だった場合' do
    before do      
      far_shop
      click_on '周辺を検索'
      expect(current_path).to eq(maps_path)
  
      pin = find('map#gmimap1 area', visible: false)
      pin.click
      click_on 'ここに行く'
      expect(page).to have_content('クエストを開始します！')
    end

    it 'クエスト画面に遷移している' do
      expect(page).to have_content('月島温泉')
      expect(page).to have_content('目的地まで')
    end

    it 'クエストをクリアできない' do
      click_on 'クエストを完了する'
      expect(page).to have_content('もっと近づいて！')
    end
  end


end
