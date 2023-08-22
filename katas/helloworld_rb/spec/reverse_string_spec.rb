require_relative '../reverse_string'

RSpec.describe 'reverse_string' do
  it 'reverses an empty string' do
    expect(reverse_string('')).to eq('')
  end

  it 'reverses a single-character string' do
    expect(reverse_string('a')).to eq('a')
  end
end
