require_relative '../dice'

describe Assignment do 
   context "When testing the Assignment klass" do 
      
      it "should output values for all dices and total for all" do 
         a = Assignment.new 
         total = a.roll_dices(3,[10,20,34]) 
         expect(total <= 64).to eq true
      end
      
      it "should raise an error for invalid sides" do
        a = Assignment.new
        response = a.validate(3,[3,1])
        expect(response).to eq(false)
      end

      it "should raise an error for invalid dices" do
        a = Assignment.new
        response = a.validate(-3,[3,1])
        expect(response).to eq(false)
      end

      it "should raise an error for invalid side value" do
        a = Assignment.new
        response = a.validate(3,[5,-3,10])
        expect(response).to eq(false)
      end
   end
end