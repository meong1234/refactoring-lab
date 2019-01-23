require "customer"
require "movie"
require "rental"

module RentalApp
  describe 'Customer' do
    let(:customer) { Customer.new('Iqbal') }

    describe 'Statement' do
      describe 'regular movie' do
        let(:movie) { Movie.new('Pulp Fiction', Movie::REGULAR) }

        context 'rented days <= 2' do
          let(:rental) { Rental.new(movie, 1) }

          it 'should return the correct statement result' do
            customer.add_rental(rental)

            expect(customer.statement).to eq(
              "Rental Record for Iqbal\n" +
              "\tPulp Fiction\t2\n" +
              "Amount owed is 2\n" +
              "You earned 1 frequent renter points"
            )
          end
        end

        context 'rented days > 2' do
          let(:rental) { Rental.new(movie, 3) }

          it 'should return the correct statement result' do
            customer.add_rental(rental)

            expect(customer.statement).to eq(
              "Rental Record for Iqbal\n" +
              "\tPulp Fiction\t3.5\n" +
              "Amount owed is 3.5\n" +
              "You earned 1 frequent renter points"
            )
          end
        end

      end

      context 'new release movie' do
        it 'should return the correct statement result' do
        end
      end

      context 'childrens movie' do
        it 'should return the correct statement result' do
        end
      end
    end
  end
end

