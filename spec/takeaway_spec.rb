require 'takeaway'

describe 'takeaway' do

let(:dish) 		{ :burrito										}
let(:takeaway) 	{ Takeaway.new									}
let(:order)		{ ["burrito", "2", "yes","cola", "2", "no"]		}
let(:quantity)	{ 2												}

	context "when asked for the menu" do

		it "returns the price of a dish" do
		expect(takeaway.price(:burrito)).to eq 7
		end

		it "displays the list of dishes with their price" do 
		expect(takeaway.show_menu)
		end
	end
	
	context "when ordering" do

		it "takes the client's order" do
		allow(takeaway).to receive(:gets).exactly(3).times.and_return("burrito", "2", "no\n")
		takeaway.take_order
		expect(takeaway.order[:burrito].nil?).to be false
		end	

		it "asks the client how much of each dish he wants" do
		allow(takeaway).to receive(:gets).exactly(3).times.and_return("burrito", "2", "no\n")
		takeaway.take_order
		expect(takeaway.order[:burrito]).to eq 2
		end	


		it "asks the client if he wants another dish" do
		allow(takeaway).to receive(:gets).exactly(6).times.and_return(*order)
		takeaway.take_order
		expect(takeaway.order_more).to eq "no"
		end

		it "calculates the total amount of the order" do
		allow(takeaway).to receive(:gets).exactly(6).times.and_return(*order)
		takeaway.take_order
		expect(takeaway.order_total).to eq 18
		end

	context "when there is an error" do

		it "returns an error message if order is below 5 pounds" do
		allow(takeaway).to receive(:gets).exactly(3).times.and_return("cola", "2", "no")
		takeaway.take_order
		expect{takeaway.order_total}.to raise_error("£5 order minimum not reached")
		end

	end


	end
end