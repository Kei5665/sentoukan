require 'rails_helper'

RSpec.describe 'Maps', type: :system do
  let(:near_shop) { create(:shop, name: "銀座湯", address:"住所1", latitude: 35.674653305483524, longitude: 139.77025262599443) }
  let(:far_shop) { create(:shop, name: "月島温泉", address:"住所2", latitude: 35.66375681411227, longitude: 139.78108269715878) }

  # 最初にログインする
  before do
    visit root_path
    click_on 'スタート'
    expect(page).to have_content 'ようこそ！ゲストさん'
  end

  describe '最初に表示される画面' do
    before do
      visit maps_path
      expect(current_path).to eq(maps_path), 'mapsページへリダイレクトされていません'
    end

    it "現在位置のピンが表示される" do
      within('#map') do
        expect(page.all("img[src$='https://maps.gstatic.com/mapfiles/transparent.png']").count).to eq 1
      end
    end

    it "ナビが表示されている" do
      expect(page).to have_selector '#nav'
    end

    it "メニューが表示される" do
      click_on 'nav-link'
      expect(page).to have_css '.dropdown-menu'
    end
  end

  describe '検索時に表示される画面' do
    before do
      near_shop
      far_shop
      click_on '周辺を検索'
      expect(current_path).to eq(maps_path), 'mapsページへリダイレクトされていません'
    end

    it "ピンが3つ表示される", js: true do
      within('#map') do
        expect(page.all("img[src$='https://maps.gstatic.com/mapfiles/transparent.png']").count).to eq 3
      end
    end

    it "ピンをクリックすると店情報が表示される" do
      pin = find("map#gmimap1 area", visible: false)
      pin.click
      expect(page).to have_content('銀座湯')
    end
  end

  describe 'クエスト画面に遷移できる' do
    before do
      near_shop
      far_shop
      click_on '周辺を検索'
      expect(current_path).to eq(maps_path)

      pin = find("map#gmimap1 area", visible: false)
      pin.click
      expect(page).to have_content('銀座湯')
    end

    it "クエスト画面に遷移できる" do
      click_on 'ここに行く'
      expect(page).to have_content('クエストを開始します！')
    end
  end
end