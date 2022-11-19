require 'spec_helper'

describe Mochila do
  it 'debe ser 2 cuando guardo 1 menu familiar' do
    mochila = described_class.new
    mochila.guardar(Menu.new(3,'Menu familiar', 250))
    expect(mochila.capacidad).to eq(2)
  end

  it 'debe ser 1 cuando guardo 1 menu familiar y 1 menu individual' do
    mochila = described_class.new
    mochila.guardar(Menu.new(3,'Menu familiar', 250))
    mochila.guardar(Menu.new(1,'Menu individual', 100))
    expect(mochila.capacidad).to eq(1)
  end

  it 'debe lanzar NoHayEspacio cuando guardo 2 menues familiar' do
    mochila = described_class.new
    mochila.guardar(Menu.new(3,'Menu familiar', 250))
    expect{ mochila.guardar(Menu.new(3, 'Menu familiar', 250)) }.to raise_error(NoHayEspacio)
  end
end
