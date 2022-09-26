require 'rails_helper'

RSpec.describe 'Maps', type: :system do
  let(:near_shop) { create(:shop, name: "銀座湯", address:"住所1", latitude: 35.674653305483524, longitude: 139.77025262599443) }
  let(:far_shop) { create(:shop, name: "月島温泉", address:"住所2", latitude: 35.66375681411227, longitude: 139.78108269715878) }
  let(:near_quest) { create(:quest, user_id: user.id, shop_id: near_shop.id, latitude: near_shop.latitude, longitude: near_shop.longitude) }

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
    it "ピンが表示される" do
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
end