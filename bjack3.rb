def calculate_total(cards) 
# [['H', '3'], ['S', 'Q'], ... ]
  sum = 0
  arr = cards.map{|e| e[1] }
  arr.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end
  #sum = cards[0][1].to_i + cards[1][1].to_i
  sum
end

puts "Welcome to Blackjack!"

suits = ['H', 'D', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!

# Deal Cards

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)


# Show Cards

puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
puts "You have: #{mycards[0]} and #{mycards[1]}, for a total of: #{mytotal}"
puts ""
puts "What would you like to do? 1) hit 2) stay"
hit_or_stay = gets.chomp

if hit_or_stay == "hit"
   mycards << deck.pop
   puts "YOU HIT"
   mytotal = calculate_total(mycards)
if mytotal > 21
   puts "Sorry, GAME OVER YOU BUST!!"
elsif mytotal == 21
    puts "You have 21"

else 
    puts "You have #{mytotal}"
    puts "What would you like to do? 1) hit 2) stay"
    hit_or_stay = gets.chomp
    if hit_or_stay == "hit"
      mycards << deck.pop
      puts "YOU HIT"
      mytotal = calculate_total(mycards)
    end
  end 
end


if dealertotal < 16
   dealercards << deck.pop
   dealertotal = calculate_total(dealercards)
   puts "If Dealer has 16 or less, Dealer must hit"
    
end

if dealertotal == mytotal
  puts "Dealer has #{dealertotal}"
  puts "You have #{mytotal}"
  puts "Draw, house wins"
elsif dealertotal < mytotal || dealertotal > 21
  puts "Dealer has #{dealertotal}"
  puts "You have #{mytotal}, you win!"
end
