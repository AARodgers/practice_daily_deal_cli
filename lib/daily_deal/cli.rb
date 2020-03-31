class DailyDeal::CLI

    def call
        list_deals
        menu
        goodbye
    end

    def list_deals
        #this is fake data for now and using here doc to create a long string
        puts "Today's Daily Deals: "
        # puts <<-DOC.gsub /^\s+/, ''
        #     1. PCH - $27 - Still available!
        #     2. Lenovo - $199.99 - Still available!"
        # DOC
        @deals = DailyDeal::Deal.today
        @deals.each.with_index(1) do |deal, i|
            puts "#{i}. #{deal.name} - #{deal.price} -  #{deal.availability}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the number of the product that you want more info on, or list to see full list or type exit: "
            input = gets.strip.downcase

            if input.to_i > 0
                the_deal = @deals[input.to_i-1]
                puts "#{the_deal.name} - #{the_deal.price} -  #{the_deal.availability}"
            elsif input == "list"
                list_deals
            else
                puts "Not sure what you want: type list or exit"
            end

            # case input
            # when "1"
            #     puts "More info on product 1"
            # when "2"
            #     puts "More info on product 2"
            # when "list"
            #     list_deals
            # else
            #     puts "Not sure what you want: type list or exit"
            # end

        end
    end

    def goodbye
       puts "See you tomorrow for more deals!"
    end
end
