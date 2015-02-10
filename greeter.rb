# greeter.rb

require 'better_errors'

configure :development do
	use BetterErrors::Middleware
	BetterErrors.application_root = __dir__
end

class Greeter
  def greet
  	"Hey, I'm Frank Sinatra. DoWop DoWhopSheBop, Yeaaaahu!"
  end

  def quote tag=nil
	quotes = {
		:love => [
			"The cigarettes you light one after another wont help you forget her.",
			"....A simple I love you means more than money....",
			"For nobody else, gave me thrill-with all your faults, I love you still. It had to be you, wonderful you, it had to be you.",
			"....A simple I love you means more than money...."
		],
		:women => [
			"I like intelligent women. When you go out, it shouldnt be a staring contest.",
			"You may be a puzzle, but I like the way the parts fit."
		],
		:alcohol => [
			"I feel sorry for people that dont drink, because when they wake up in the morning, that is the best they are going to feel all day-",
			"Alcohol may be man's worst enemy, but the bible says love your enemy."
		],
		:life => [
			"Ya gotta love livin, pally, cuz dyins a pain in the ass!",
			"The best revenge is massive success.",
			"The big lesson in life, baby, is never be scared of anyone or anything.",
			"I would like to be remembered as a man who had a wonderful time living life, a man who had good friends, fine family - and I don't think I could ask for anything more than that, actually",
			"The best is yet to come and won't that be fine."
		],
		:religion => [
			"When lip service to some mysterious deity permits bestiality on Wednesday and absolution on Sunday, cash me out."
		]
	}

	tag = tag.to_sym if tag

	if tag && quotes[tag]
		quotes[tag][rand(0..quotes[tag].size)]

	# ^^ Same as above but scary lookin' ^^
	# quotes = "<h2>Quotes matching tag: '#{tag}'</h2><ul><li><h3>#{quotes[tag.to_sym][rand(0..quotes[tag.to_sym].length)]}</h3></li></ul>"

	else
		"The best is yet to come and won't that be fine."
	end
  end
end