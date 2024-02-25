require_relative '../lib/game'

# rubocop:disable Metrics/BlockLength

describe Game do
  subject(:game) { described_class.new }

  describe '#check_winner' do
    context 'when combo is completed' do
      before do
        game.instance_variable_set(:@board, instance_double(Board))
        game.instance_variable_set(:@user_team, 'O')
        allow(game.board).to receive(:combo_completed?).and_return(true)
      end

      it 'updates @winner' do
        game.check_winner
        updated_winner = game.winner
        expect(updated_winner).to eq('O')
      end
    end

    context 'when combo is not completed' do
      before do
        game.instance_variable_set(:@board, instance_double(Board))
        game.instance_variable_set(:@user_team, 'X')
        allow(game.board).to receive(:combo_completed?).and_return(false)
      end

      it 'does not update @winner' do
        game.check_winner
        updated_winner = game.winner
        expect(updated_winner).to be_nil
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
