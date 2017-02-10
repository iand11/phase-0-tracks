require_relative 'solo_game'

describe SoloGame do 
	let (:game) {SoloGame.new ("unicorn") }

	it "stores the word given on ititializantion" do
		expect(game.get_word).to eq ["u","n","i","c","o","r","n"]
	end
	
	it "creates a new array filled with -" do
		expect(game.hide_word). to eq ["-","-","-","-","-","-","-"]
	end
	
	it "stores the letters guessed" do 
		game.get_word
		expect(game.A('a')).to eq ['a']
	end
	
	it "shows a correctly guessed letter instead of -" do 
		game.get_word
		game.hide_word
		expect(game.show_guessed_letter("n")).to eq ["-","n","-","-","-","-","n"]
	end 

	
end 
