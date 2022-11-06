require 'spec_helper'

describe Usuario do
  context 'cuando es creado' do
    it 'debe ser invalido cuando el nombre no esta' do
      expect { described_class.new(nil,'direccion','1') }.to raise_error(UsuarioInvalido, 'usuario invalido')
    end

    it 'debe ser invalido cuando la direccion no esta' do
        expect { described_class.new('Juan',nil,'1') }.to raise_error(UsuarioInvalido, 'usuario invalido')
    end

    it 'debe ser invalido cuando el telefono no esta' do
        expect { described_class.new('Juan','direccion',nil) }.to raise_error(UsuarioInvalido, 'usuario invalido')
    end
  end

  # context 'when is changed' do
  #   let(:user) { described_class.new({name: 'John'}) }
  # 
  #   it 'should be invalid when name is missing' do
  #     expect { user.replace_name_with(nil) }.to raise_error(InvalidUser, 'name is missing')
  #   end 
  # 
  #   it 'should be invalid when name is blank' do
  #     expect { user.replace_name_with('') }.to raise_error(InvalidUser, 'name is missing')
  #   end
  # 
  #   it 'should change name' do
  #     user.replace_name_with('Paul')
  #     expect(user.name).to eq('Paul')
  #   end
  # end
end