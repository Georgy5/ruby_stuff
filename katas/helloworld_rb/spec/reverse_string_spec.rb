require_relative '../reverse_string'

RSpec.describe 'reverse_string' do
  it 'reverses an empty string' do
    expect(reverse_string('')).to eq('')
  end

  it 'reverses a single-character string' do
    expect(reverse_string('a')).to eq('a')
  end

  it 'reverses a short string' do
    expect(reverse_string('hello')).to eq('olleh')
  end

  it 'reverses a longer string' do
    expect(reverse_string('programming')).to eq('gnimmargorp')
  end

  it 'reverses a longer string' do
    expect(reverse_string('programming')).to eq('gnimmargorp')
  end

  context 'with invalid input' do
    it 'handles nil input' do
      expect { reverse_string(nil) }.to raise_error(ArgumentError)
    end

    it 'handles non-string input' do
      expect { reverse_string(123) }.to raise_error(ArgumentError)
    end
  end
end
