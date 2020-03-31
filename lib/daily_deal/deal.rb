class DailyDeal::Deal
    attr_accessor :name, :price, :availability, :url

    def self.today
        self.scrape_deals
    end

    def self.scrape_deals
        deals = []
        deals << self.scrape_woot
        deals << self.scrape_meh
        deals

    end

    def self.scrape_woot
        doc = Nokogiri::HTML(open("https://woot.com"))

        deal = self.new
        deal.name = doc.search("h2.main-title").text.strip
        deal.price = doc.search("#todays-deal span.price").text.strip
        deal.url = doc.search("a.wantone").first.attr("href").strip
        deal.availability = true
        deal
    end

    def self.scrape_meh
        doc = Nokogiri::HTML(open("https://meh.com"))

        deal = self.new
        deal.name = doc.search("section.features h2").text.strip
        deal.price = doc.search("button.buy-button").text.gsub("Buy it.", "")
        deal.url = "https://meh.com"
        deal.availability = true
        deal
    end
end
        #should return instances of deals
        # puts "Today's Daily Deals: "
        # puts <<-DOC.gsub /^\s+/, ''
        #     1. PCH - $27 - Still available!
        #     2. Lenovo - $199.99 - Still available!"
        # DOC

        #Need to replace fake data below with scraped data from meh and woot. This is the old .today method
    # def self.today
        # deal_1 = self.new
        # deal_1.name = "PCH"
        # deal_1.price = "$27"
        # deal_1.availability = true
        # deal_1.url = "https://meh.com/"

        # deal_2 = self.new
        # deal_2.name = "Lenovo"
        # deal_2.price = "$199"
        # deal_2.availability = true
        # deal_2.url = "https://www.woot.com/plus/apple-2018-macbook-air-macbook-pros?ref=w_cnt_gw_dly_tl"

        # [deal_1, deal_2]
    # end
